// filepath: TodoMate2Tests/DefaultAuthenticationRepositoryTests.swift
import Testing
@testable import TodoMate2

// Spy and stub services for testing
private final class AuthServiceStub: AuthServiceProtocol {
	var currentUserId: String?
	
    func signInWithGoogle() async throws -> String { DomainConstant.User.stubId }
    func signOut() async throws { }
}

private final class FirestoreSpy: FirestoreServiceProtocol {
    var didSet = false
    var setDocumentArgs: (document: User, collection: String, documentId: String)?
    var existingUser: User?

    func fetchDocument<T>(collection: String, documentId: String) async throws -> T? where T : Codable {
        return (existingUser as? T)
    }

    func setDocument<T>(_ document: T, collection: String, documentId: String) async throws where T : Codable {
        if let user = document as? User {
            didSet = true
            setDocumentArgs = (user, collection, documentId)
        }
    }

    func fetchDocuments<T>(collection: String, query: [String : Any]) async throws -> [T] where T : Codable {
        return []
    }
}

private final class CacheNoOp: CacheServiceProtocol {
    func save<T>(_ object: T, forKey key: String) throws where T : Codable { }
    func load<T>(forKey key: String) throws -> T? where T : Codable { return nil }
}

struct DefaultAuthenticationRepositoryTests {
    @Test func signIn_createsNewUserWhenNoneExists() async throws {
        let authStub = AuthServiceStub()
        let firestore = FirestoreSpy()
        let cache = CacheNoOp()
        firestore.existingUser = nil
        let repo = DefaultAuthenticationRepository(
            authService: authStub,
            firestoreService: firestore,
            cacheService: cache
        )
        let user = try await repo.signIn()
        #expect(user.id == DomainConstant.User.stubId)
        #expect(firestore.didSet)
        #expect(firestore.setDocumentArgs?.collection == "users")
        #expect(firestore.setDocumentArgs?.documentId == DomainConstant.User.stubId)
    }

    @Test func signIn_returnsExistingUserWhenPresent() async throws {
        let authStub = AuthServiceStub()
        let firestore = FirestoreSpy()
        let cache = CacheNoOp()
        let existing = User(id: DomainConstant.User.stubId)
        firestore.existingUser = existing
        let repo = DefaultAuthenticationRepository(
            authService: authStub,
            firestoreService: firestore,
            cacheService: cache
        )
        let user = try await repo.signIn()
        #expect(user.id == existing.id)
        #expect(!firestore.didSet)
    }
}
