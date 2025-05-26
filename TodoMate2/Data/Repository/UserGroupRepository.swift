import Foundation

protocol UserGroupRepository {
    func fetchUserGroup(withId id: String) async throws -> UserGroup?
    func createOrUpdateUserGroup(_ group: UserGroup) async throws
}