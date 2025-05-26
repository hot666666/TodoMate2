//
//  TodoMate2App.swift
//  TodoMate2
//
//  Created by hs on 5/24/25.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct TodoMate2App: App {
	init() {
		guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else {
			print("Firebase client ID is not configured.")
			return }
		FirebaseApp.configure()
		
		guard let clientId = FirebaseApp.app()?.options.clientID else {
			print("Firebase client ID is not configured.")
			return }
		let configuration = GIDConfiguration(clientID: clientId)
		GIDSignIn.sharedInstance.configuration = configuration
	}
	
	var body: some Scene {
		WindowGroup {
			// View가 시작되는 지점
			Text("Hello, TodoMate2!")
		}
	}
}
