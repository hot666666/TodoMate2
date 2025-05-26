import SwiftUI
import FirebaseAuth
import GoogleSignIn

enum SignInServiceError: Error {
    case noActiveWindowScene
}

final class DefaultAuthService: AuthServiceProtocol {
    var currentUserId: String? {
        Auth.auth().currentUser?.uid
    }

		@MainActor
    func signInWithGoogle() async throws -> String {
        let signInResult: GIDSignInResult

#if os(macOS)
        guard let window = NSApplication.shared.windows.first else {
            print("[DefaultAuthService] - WindowScene 오류")
            throw SignInServiceError.noActiveWindowScene
        }
        signInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: window)
#elseif os(iOS)
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootVC = window.rootViewController else {
            print("[DefaultAuthService] - WindowScene 오류")
            throw SignInServiceError.noActiveWindowScene
        }
        signInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
#endif

        guard let idToken = signInResult.user.idToken?.tokenString else {
						throw SignInServiceError.noActiveWindowScene
				}
				let accessToken = signInResult.user.accessToken.tokenString
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        let authResult = try await Auth.auth().signIn(with: credential)
        return authResult.user.uid
    }

    func signOut() async throws {
        try Auth.auth().signOut()
        GIDSignIn.sharedInstance.signOut()
    }
}
