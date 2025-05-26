import Foundation

final class DefaultCacheService: CacheServiceProtocol {
    func save<T: Codable>(_ object: T, forKey key: String) throws {
        let data = try JSONEncoder().encode(object)
        UserDefaults.standard.set(data, forKey: key)
    }

    func load<T: Codable>(forKey key: String) throws -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        let object = try JSONDecoder().decode(T.self, from: data)
        return object
    }
}