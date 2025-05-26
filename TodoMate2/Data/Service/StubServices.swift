import Foundation

/// Stub implementations for previews and tests
final class StubAuthService: AuthServiceProtocol {
    var currentUserId: String? = DomainConstant.User.stubId

    func signInWithGoogle() async throws -> String {
        return currentUserId!
    }

    func signOut() async throws { }
}

final class StubFirestoreService: FirestoreServiceProtocol {
    func fetchDocument<T: Codable>(collection: String, documentId: String) async throws -> T? {
        return nil
    }

    func setDocument<T: Codable>(_ document: T, collection: String, documentId: String) async throws { }

    func fetchDocuments<T: Codable>(collection: String, query: [String: Any]) async throws -> [T] {
        return []
    }
}

final class StubCacheService: CacheServiceProtocol {
    func save<T: Codable>(_ object: T, forKey key: String) throws { }

    func load<T: Codable>(forKey key: String) throws -> T? {
        return nil
    }
}
