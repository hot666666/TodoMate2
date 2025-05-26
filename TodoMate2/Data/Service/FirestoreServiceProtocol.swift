import Foundation

protocol FirestoreServiceProtocol {
    func fetchDocument<T: Codable>(collection: String, documentId: String) async throws -> T?
    func setDocument<T: Codable>(_ document: T, collection: String, documentId: String) async throws
    func fetchDocuments<T: Codable>(collection: String, query: [String: Any]) async throws -> [T]
}