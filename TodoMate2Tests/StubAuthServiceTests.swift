// filepath: TodoMate2Tests/StubAuthServiceTests.swift
import Testing
@testable import TodoMate2

struct StubAuthServiceTests {
    @Test func testCurrentUserIdDefaultsToStubId() {
        let authService = StubAuthService()
        #expect(authService.currentUserId == DomainConstant.User.stubId)
    }

    @Test func testSignInWithGoogleReturnsStubId() async throws {
        let authService = StubAuthService()
        let id = try await authService.signInWithGoogle()
        #expect(id == DomainConstant.User.stubId)
    }

    @Test func testSignOutDoesNotThrow() async throws {
        let authService = StubAuthService()
        try await authService.signOut()
        #expect(true)
    }
}