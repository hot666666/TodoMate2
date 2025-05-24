//
//  User.swift
//  TodoMate2
//
//  Created by hs on 5/24/25.
//

import Foundation

struct User: Codable, Identifiable {
	let id: String /// DocumentID
	var displayName: String
	var group: UserGroup?
	let createdAt: Date
	var updatedAt: Date
	
	init(
		id: String,
		displayName: String,
		group: UserGroup? = nil,
		createdAt: Date,
		updatedAt: Date
	) {
		self.id = id
		self.displayName = displayName
		self.group = group
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
	
	init(id: String, group: UserGroup? = nil) {
		let now: Date = .now
		self.init(
			id: id,
			displayName: DomainConstants.User.unknownDisplayName,
			group: group,
			createdAt: now,
			updatedAt: now
		)
	}
}

extension User {
	static let dummy = User(id: "", group: .dummy)
	
	static let stub = User(
		id: DomainConstants.User.stubId,
		displayName: DomainConstants.User.stubDisplayName,
		group: .stub,
		createdAt: Date(),
		updatedAt: Date()
	)
}
