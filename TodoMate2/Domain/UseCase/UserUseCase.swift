import Foundation

protocol UserUseCase {
    func fetchUser() async throws -> User
    func updateUser(_ user: User) async throws
}