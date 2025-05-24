//
//  UserGroup.swift
//  TodoMate2
//
//  Created by hs on 5/24/25.
//

import Foundation

struct UserGroup: Codable {
  let id: String /// DocumentID
  var members: [String]
  let createdAt: Date
  var updatedAt: Date
}

extension UserGroup {
  static let dummy = UserGroup(
		id: "",
		members: [""],
		createdAt: .now,
		updatedAt: .now
	)
	
  static let stub = UserGroup(
    id: DomainConstants.UserGroup.stubId,
    members: [DomainConstants.UserGroup.stubMember],
    createdAt: Date(),
    updatedAt: Date()
  )
}
