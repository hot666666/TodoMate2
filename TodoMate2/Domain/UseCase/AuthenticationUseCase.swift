import Foundation

protocol AuthenticationUseCase {
    func signInWithGoogle() async throws -> User
    func signOut() async throws
}