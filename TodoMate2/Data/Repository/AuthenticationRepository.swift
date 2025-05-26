import Foundation

protocol AuthenticationRepository {
    func signIn() async throws -> User
    func signOut() async throws
}