//
//  DomainConstants.swift
//  TodoMate2
//
//  Created by hs on 5/24/25.
//

import Foundation

enum DomainConstants {
  // MARK: - User
  enum User {
    static let unknownDisplayName = "Unknown"
    static let stubId = "testUser"
    static let stubDisplayName = "stub"
  }
  
  // MARK: - UserGroup
  enum UserGroup {
    static let stubId = "testUserGroup"
    static let stubMember = User.stubId
  }
}
