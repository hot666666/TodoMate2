# Tasks

이 문서는 README.md의 프로젝트 설명과 흐름을 바탕으로 TodoMate2 프로젝트 완료를 위한 주요 작업 목록과 필요한 인터페이스 정의를 정리한 것입니다.

(* 이하 경로는 `TodoMate2` 디렉터리 기준입니다.)

## 1. Domain Layer
- [ ] 기존 Entity(`User`, `UserGroup`, `Todo`) 검토 및 보완
- [ ] Domain/UseCase에 Use Case 인터페이스 정의
  - AuthenticationUseCase
  - UserUseCase
  - UserGroupUseCase
  - TodoUseCase

## 2. Data Layer

### 2.1 Repository
- [ ] Data/Repository에 Repository 프로토콜 정의
  - AuthenticationRepository
  - UserRepository
  - UserGroupRepository
  - TodoRepository

### 2.2 Service
- [ ] Data/Service에 Service 프로토콜 정의
  - AuthServiceProtocol
  - FirestoreServiceProtocol
  - CacheServiceProtocol

## 3. Dependency Injection
- [ ] Dependency/DIContainer에 Use Case, Repository, Service 구현체 등록

## 4. 인증 및 사용자 관리
- [ ] GoogleSignIn을 통한 로그인 플로우 구현(AuthenticationUseCase)
- [ ] Firebase Auth와 연동하여 사용자 인증
- [ ] 최초 로그인 시 Firestore에 User 생성 또는 기존 User 로드
- [ ] 인증 정보 캐시를 통해 앱 재실행 시 자동 로그인 처리

## 5. 사용자 그룹 관리
- [ ] UserGroup 로드 또는 초기화(UserGroupUseCase)
- [ ] 그룹 멤버 추가/제거 기능(필요 시)

## 6. Todo 관리
- [ ] 지정된 날짜에 대한 그룹 내 모든 멤버 Todo 조회(TodoUseCase)
- [ ] 날짜 변경 시 해당 날짜의 Todo 재조회
- [ ] Todo 추가, 수정, 삭제 기능
- [ ] Firestore 실시간 업데이트 구독(필요 시)

## 7. Presentation Layer
- [ ] 그룹별 오늘의 Todo 메인 화면 구성
- [ ] TodoListView, TodoCellView, UserGroupView 등 뷰 설계
- [ ] @Observable ViewModel 구현 및 SwiftUI Preview용 Stub 제공
- [ ] View와 로직 분리를 위한 extension 활용

## 8. Testing
- [ ] Use Case 단위 테스트 작성
- [ ] Repository & Service 통합 테스트(모의 객체 활용)
- [ ] 주요 UI 흐름의 UI 테스트(login, Todo CRUD 등)

## 9. 기타
- [ ] Pre-commit 및 SwiftLint 포맷팅 확인
- [ ] 문서(README, Tasks) 최신화
- [ ] App Store 배포 준비(아이콘, 버전 관리 등)