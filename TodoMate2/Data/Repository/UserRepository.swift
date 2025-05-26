import Foundation

protocol UserRepository {
    func fetchUser(withId id: String) async throws -> User?
    func createOrUpdateUser(_ user: User) async throws
}