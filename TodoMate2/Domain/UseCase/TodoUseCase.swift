import Foundation

protocol TodoUseCase {
    func fetchTodos(for date: Date) async throws -> [Todo]
    func addTodo(_ todo: Todo) async throws
    func updateTodo(_ todo: Todo) async throws
    func deleteTodo(_ todo: Todo) async throws
}