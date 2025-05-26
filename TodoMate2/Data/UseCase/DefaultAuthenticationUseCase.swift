import Foundation

/// Default implementation of AuthenticationUseCase
final class DefaultAuthenticationUseCase: AuthenticationUseCase {
    private let repository: AuthenticationRepository

    init(repository: AuthenticationRepository) {
        self.repository = repository
    }

    func signInWithGoogle() async throws -> User {
        try await repository.signIn()
    }

    func signOut() async throws {
        try await repository.signOut()
    }
}
