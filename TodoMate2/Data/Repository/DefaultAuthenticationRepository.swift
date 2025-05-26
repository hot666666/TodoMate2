import Foundation

/// Default implementation of AuthenticationRepository
final class DefaultAuthenticationRepository: AuthenticationRepository {
    private let authService: AuthServiceProtocol
    private let firestoreService: FirestoreServiceProtocol
    private let cacheService: CacheServiceProtocol

    init(
        authService: AuthServiceProtocol,
        firestoreService: FirestoreServiceProtocol,
        cacheService: CacheServiceProtocol
    ) {
        self.authService = authService
        self.firestoreService = firestoreService
        self.cacheService = cacheService
    }

    func signIn() async throws -> User {
        // Perform Google sign-in
        let userId = try await authService.signInWithGoogle()
        // Try fetching existing user document
        if let existing: User = try await firestoreService.fetchDocument(collection: "users", documentId: userId) {
            return existing
        }
        // Create new user
        let newUser = User(id: userId)
        try await firestoreService.setDocument(newUser, collection: "users", documentId: userId)
        return newUser
    }

    func signOut() async throws {
        try await authService.signOut()
    }
}
