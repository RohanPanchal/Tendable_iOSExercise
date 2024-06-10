//
//  AuthenticationTest.swift
//  Tendable_iOSExerciseTests
//
//  Created by Rohan Panchal on 07/06/24.
//

import XCTest
@testable import Tendable_iOSExercise

final class AuthenticationTest: XCTestCase {
    var viewModel: AuthenticationViewModel!
    var mockUserService: MockAuthenticationService!
    
    override func setUp() {
        super.setUp()
        mockUserService = MockAuthenticationService()
        viewModel = AuthenticationViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        mockUserService = nil
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginSuccess() {
        mockUserService.loginResult = .success
        let expectation = self.expectation(description: "Login success")
        
        viewModel.login(email: "test@example.com", password: "password") { success in
            XCTAssertTrue(success)
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testLoginFailure() {
        mockUserService.loginResult = .failure(MockError.loginFailed)
        let expectation = self.expectation(description: "Login failure")
        
        viewModel.login(email: "test@example.com", password: "password") { success in
            XCTAssertFalse(success)
            XCTAssertEqual(self.viewModel.errorMessage, MockError.loginFailed.localizedDescription)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRegisterSuccess() {
        mockUserService.registerResult = .success
        let expectation = self.expectation(description: "Register success")
        
        viewModel.register(email: "test@example.com", password: "password") { success in
            XCTAssertTrue(success)
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRegisterFailure() {
        mockUserService.registerResult = .failure(MockError.registrationFailed)
        let expectation = self.expectation(description: "Register failure")
        
        viewModel.register(email: "test@example.com", password: "password") { success in
            XCTAssertFalse(success)
            XCTAssertEqual(self.viewModel.errorMessage, MockError.registrationFailed.localizedDescription)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
