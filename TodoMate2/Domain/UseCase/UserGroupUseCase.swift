import Foundation

protocol UserGroupUseCase {
    func fetchUserGroup() async throws -> UserGroup
    func createOrUpdateUserGroup(_ group: UserGroup) async throws
}