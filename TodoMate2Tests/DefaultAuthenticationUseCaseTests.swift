// filepath: TodoMate2Tests/DefaultAuthenticationUseCaseTests.swift
import Testing
@testable import TodoMate2

// Stub repository to verify interactions
private final class AuthenticationRepositoryStub: AuthenticationRepository {
    var didSignIn = false
    var didSignOut = false

    func signIn() async throws -> User {
        didSignIn = true
        return User.stub
    }

    func signOut() async throws {
        didSignOut = true
    }
}

struct DefaultAuthenticationUseCaseTests {
    @Test func signInWithGoogle_forwardsToRepository() async throws {
        let repoStub = AuthenticationRepositoryStub()
        let useCase = DefaultAuthenticationUseCase(repository: repoStub)
        let user = try await useCase.signInWithGoogle()
        #expect(repoStub.didSignIn)
        #expect(user.id == User.stub.id)
    }

    @Test func signOut_forwardsToRepository() async throws {
        let repoStub = AuthenticationRepositoryStub()
        let useCase = DefaultAuthenticationUseCase(repository: repoStub)
        try await useCase.signOut()
        #expect(repoStub.didSignOut)
    }
}