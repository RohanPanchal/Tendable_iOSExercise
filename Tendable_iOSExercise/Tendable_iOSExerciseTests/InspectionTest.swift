//
//  InspectionTest.swift
//  Tendable_iOSExerciseTests
//
//  Created by Rohan Panchal on 07/06/24.
//

import XCTest
@testable import Tendable_iOSExercise

final class InspectionTest: XCTestCase {
    var viewModel: InspectionsViewModel!
    var mockInspectionsService: MockInspectionsService!
    
    override func setUp() {
        super.setUp()
        mockInspectionsService = MockInspectionsService()
        viewModel = InspectionsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        mockInspectionsService = nil
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
    
    func testSubmitInspectionSuccess() {
        mockInspectionsService.submitInspectionResult = .success(())
        
        /*let inspection = Inspection()
        let expectation = self.expectation(description: "Submit Inspection success")
        
        viewModel.submitInspection(inspection: inspection) { success in
            XCTAssertTrue(success)
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }*/
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSubmitInspectionFailure() {
        mockInspectionsService.submitInspectionResult = .failure(MockInspectionError.submitInspectionFailed)
        
        /*let inspection = Inspection()
        let expectation = self.expectation(description: "Submit Inspection failure")
        
        viewModel.submitInspection(inspection: inspection) { success in
            XCTAssertFalse(success)
            XCTAssertEqual(self.viewModel.errorMessage, MockInspectionError.submitInspectionFailed.localizedDescription)
            expectation.fulfill()
        }*/
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
