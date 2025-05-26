import Foundation
import FirebaseFirestore

final class DefaultFirestoreService: FirestoreServiceProtocol {
    private var firestore: Firestore { Firestore.firestore() }

    func fetchDocument<T: Codable>(collection: String, documentId: String) async throws -> T? {
        let document = firestore.collection(collection).document(documentId)
        let snapshot = try await document.getDocument()
        guard let data = snapshot.data() else { return nil }
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
        let object = try JSONDecoder().decode(T.self, from: jsonData)
        return object
    }

    func setDocument<T: Codable>(_ document: T, collection: String, documentId: String) async throws {
        let data = try JSONEncoder().encode(document)
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw NSError(domain: "DefaultFirestoreService", code: -1)
        }
        try await firestore.collection(collection).document(documentId).setData(json)
    }

    func fetchDocuments<T: Codable>(collection: String, query: [String: Any]) async throws -> [T] {
        let collectionRef = firestore.collection(collection)
        let queryRef = query.reduce(collectionRef) { ref, pair in
            ref.whereField(pair.key, isEqualTo: pair.value)
        }
        let snapshot = try await queryRef.getDocuments()
        return try snapshot.documents.compactMap { doc in
            let data = doc.data()
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            return try JSONDecoder().decode(T.self, from: jsonData)
        }
    }
}