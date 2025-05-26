# README

TodoMate2는 사용자가 할 일을 효율적으로 관리하고 추적할 수 있도록 돕는 모바일 애플리케이션이다.

직관적인 인터페이스와 간편한 Todo 기능을 통해 개인의 생산성 향상을 목표로 하며, UserGroup이라는 그룹 내 사람들끼리 Todo를 공유하여 볼 수 있어 서로의 Todo 성취를 감독하여 일의 수행을 촉진한다.

# 개발 규칙

! 기본적으로 현재 주어진 작업에 대해 코드 작성 후, 아래의 규칙을 따라야한다.

! 또한, 아래와 더불어 일단 xcode 빌드를 실행해보고, 실패 시 오류를 분석해서 해결해야한다.

## 새로운 기능 추가 시

feat-기능명 브랜치 생성 -> 해당 기능 개발 -> Swift Testing을 통한 테스트코드 작성 -> 커밋메시지 작성 -> PR 생성

##기존 기능 수정 시

fix-기능명 브랜치 생성 -> 해당 기능 수정 -> Swift Testing을 통한 테스트코드 작성 -> 커밋메시지 작성 -> PR 생성

# 개발 환경
- Xcode 16
- SwiftUI
- Swift 5.9
- Firebase SDK (Auth, Firestore), GoogleSignIn SDK

# Domain
- 엔티티로 정의된 항목 변경 시, 반드시 알림을 고지해야함
- Domain/Entity : 엔티티를 통해 핵심 도메인 모델을 정의하고, 이를 기반으로 앱의 기능을 구현
- Domain/UseCase : 도메인 모델을 활용하여 앱의 주요 기능을 구현하는 UseCase를 정의

클린 아키텍쳐를 지향하며, 테스트에 용이하도록 의존성 주입(DIContainer)을 활용한다

# Data
- DIContainer에 의존성 주입을 통해 데이터 레이어를 구성

# Presentation
- View와 @Observable 객체를 활용하여 UI를 구성
- 개발 환경: Xcode(16)

# 고려 사항
- 클린아키텍쳐 지향, DIContainer를 활용하여 의존성 주입(데이터 레이어 요소들 인터페이스를 정의하여, DIContainer를 통해 주입)
- MVVM 보단 MV를 지향, 이는 뷰에서 사용될 모델을 @Observable로 선언하여 구현(이때, View는 extension을 통해 로직 부분과 UI 부분을 분리)
- 항상 Swift Testing(WWDC24)를 활용하여 테스트 코드 작성을 염두하며 개발
- #Preview를 위한 stub을 적용하여 개발 시 프리뷰를 활용할 수 있도록 해야함(인터페이스를 통해 static으로 정의하여 전달)


# 예시코드(코드 작성 시, 주요 오류 지점 해결을 위한 예시코드)
- Example/ExampleCode1 : @State 변수 생성자에서 초기화방법 및 @Environment를 통해 .environment로 전달한 Observable 객체 접근 예시
