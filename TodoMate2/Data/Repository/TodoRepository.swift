import Foundation

protocol TodoRepository {
    func fetchTodos(for date: Date, groupId: String) async throws -> [Todo]
    func addTodo(_ todo: Todo) async throws
    func updateTodo(_ todo: Todo) async throws
    func deleteTodo(_ todo: Todo) async throws
}