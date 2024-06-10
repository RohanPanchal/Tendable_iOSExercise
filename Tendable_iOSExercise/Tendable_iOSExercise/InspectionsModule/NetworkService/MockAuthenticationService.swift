//
//  MockAuthenticationService.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 07/06/24.
//

import Foundation

// Define the result type for user service
enum AuthenticationServiceResult {
    case success
    case failure(Error)
}

// Mock error for testing purposes
enum MockError: Error {
    case loginFailed
    case registrationFailed
}

class MockAuthenticationService {
    var loginResult: AuthenticationServiceResult = .failure(MockError.loginFailed)
    var registerResult: AuthenticationServiceResult = .failure(MockError.registrationFailed)

    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        switch loginResult {
        case .success:
            completion(.success(()))
        case .failure(let error):
            completion(.failure(error))
        }
    }

    func register(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        switch registerResult {
        case .success:
            completion(.success(()))
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
