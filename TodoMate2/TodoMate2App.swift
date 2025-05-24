//
//  TodoMate2App.swift
//  TodoMate2
//
//  Created by hs on 5/24/25.
//

import SwiftUI
import FirebaseCore

@main
struct TodoMate2App: App {
	init() {
		guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else { return }
		FirebaseApp.configure()
	}
	
	var body: some Scene {
		WindowGroup {
			// entry point of the app
		}
	}
	
}
