//
//  Todo.swift
//  TodoMate2
//
//  Created by hs on 5/24/25.
//

import SwiftUI

enum TodoStatus: String, CaseIterable, Codable {
	case inComplete = "미완료"
	case todo = "시작 전"
	case inProgress = "진행 중"
	case complete = "완료"
	
	var color: Color {
		switch self {
		case .todo: return .customGray
		case .inProgress: return .customBlue
		case .complete: return .customGreen
		case .inComplete: return .customRed
		}
	}
}

struct Todo: Identifiable {
	let id: String					/// DocumentID
	var content: String
	var status: TodoStatus
	var detail: String
	var date: Date
	let createdAt: Date
	var updatedAt: Date
	let owner: String 			/// UserID
	
	init(
		id: String,
		content: String = "",
		status: TodoStatus = .todo,
		detail: String = "",
		date: Date = .now,
		createdAt: Date,
		updatedAt: Date,
		owner: String
	) {
		self.id = id
		self.content = content
		self.status = status
		self.detail = detail
		self.date = date.startOfDay
		self.createdAt = createdAt
		self.updatedAt = updatedAt
		self.owner = owner
	}
	
	static func == (lhs: Todo, rhs: Todo) -> Bool {
		lhs.date == rhs.date
		&& lhs.content == rhs.content
		&& lhs.status == rhs.status
		&& lhs.detail == rhs.detail
		&& lhs.owner == rhs.owner
		&& lhs.id == rhs.id
	}
}

extension Todo {
	static let stub = Todo(
		id: UUID().uuidString,
		date: .now,
		createdAt: .now,
		updatedAt: .now,
		owner: DomainConstant.User.stubId
	)
	
	static func copy(from todo: Todo) -> Todo {
		let now: Date = .now
		return Todo(
			id: UUID().uuidString,
			content: todo.content,
			status: .todo,
			detail: todo.detail,
			date: todo.date,
			createdAt: now,
			updatedAt: now,
			owner: todo.owner
		)
	}
}
