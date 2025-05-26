//
//  DIContainer.swift
//  TodoMate2
//
//  Created by hs on 5/26/25.
//

import Observation

/// 앱의 모든 의존성을 관리하는 컨테이너
@Observable
final class DIContainer {
	// MARK: Services
	@ObservationIgnored let authService: AuthServiceProtocol
	@ObservationIgnored let firestoreService: FirestoreServiceProtocol
	@ObservationIgnored let cacheService: CacheServiceProtocol
	
	// MARK: Repositories
	@ObservationIgnored let authenticationRepository: AuthenticationRepository
	
	// MARK: Use Cases
	@ObservationIgnored let authenticationUseCase: AuthenticationUseCase
	
	init() {
		self.authService = DefaultAuthService()
		self.firestoreService = DefaultFirestoreService()
		self.cacheService = DefaultCacheService()
		self.authenticationRepository = DefaultAuthenticationRepository(
			authService: self.authService,
			firestoreService: self.firestoreService,
			cacheService: self.cacheService
		)
		self.authenticationUseCase = DefaultAuthenticationUseCase(
			repository: self.authenticationRepository
		)
	}
	
	/// Initializes the container with explicit service implementations.
	init(
		authService: AuthServiceProtocol,
		firestoreService: FirestoreServiceProtocol,
		cacheService: CacheServiceProtocol
	) {
		self.authService = authService
		self.firestoreService = firestoreService
		self.cacheService = cacheService
		self.authenticationRepository = DefaultAuthenticationRepository(
			authService: self.authService,
			firestoreService: self.firestoreService,
			cacheService: self.cacheService
		)
		self.authenticationUseCase = DefaultAuthenticationUseCase(
			repository: self.authenticationRepository
		)
	}
}

extension DIContainer {
	static let preview: DIContainer = {
		DIContainer(
			authService: StubAuthService(),
			firestoreService: StubFirestoreService(),
			cacheService: StubCacheService()
		)
	}()
}

