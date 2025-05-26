import Foundation

protocol AuthServiceProtocol {
    func signInWithGoogle() async throws -> String
    func signOut() async throws
    var currentUserId: String? { get }
}