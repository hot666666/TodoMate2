# @State와 @Observable 사용 예시

- SwiftUI를 사용하여 인증된 사용자에게 보여줄 화면을 구현한 예시코드
- @State의 생성자를 통한 초기화
- @Obervable 객체가 상위 뷰에서 @State로 정의되고, .environment로 전달 -> 하위 뷰에서 @Environment로 접근


## 코드
```swift

import SwiftData
import SwiftUI

struct AuthenticatedView: View {
	@Environment(\.modelContext) private var modelContext
	@Environment(AuthManager.self) private var authManager
	@State private var userStore: UserStore
	@State private var todoStore: TodayTodoStore
	
	init(uid: String, userService: UserServiceType, userCache: UserCacheType,
			 todoService: TodoServiceType, modelContext: ModelContext) {
		_userStore = State(wrappedValue: UserStore(
			signedInUid: uid,
			userService: userService,
			userCache: userCache
		))
		_todoStore = State(wrappedValue: TodayTodoStore(
			signedInUid: uid,
			todoService: todoService,
			modelContext: modelContext
		))
	}
	
	var body: some View {
		content
			.task {
				await userStore.fetchUser()
			}
			.alert(
				"유저 오류",
				isPresented: Bindable(userStore).showPopup,
				presenting: userStore.errorMessage
			) { _ in
				Button("확인") {
					userStore.showPopup = false
					authManager.signOut()
				}
			} message: { message in
				Text(message)
			}
	}
	
	@ViewBuilder
	private var content: some View {
		if userStore.hasGroup {
			MainView()
				.task {
					await todoStore.startListening(for: userStore.uidsInGroup)
				}
				.environment(userStore)
				.environment(todoStore)
		} else {
			noGroupView
		}
	}
	
	private var noGroupView: some View {
		ContentUnavailableView(label: {
			Label("그룹이 존재하지 않습니다", systemImage: "xmark")
		}) {
			Text("그룹에 우선 가입하세요.")
		} actions: {
			SignOutButton()
		}
	}
}
```
