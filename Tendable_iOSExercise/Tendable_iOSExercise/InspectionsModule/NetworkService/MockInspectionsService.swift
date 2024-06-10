//
//  MockInspectionsService.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 07/06/24.
//

import Foundation

enum MockInspectionError: Error {
    case getInspectionsFailed
    case submitInspectionFailed
}

class MockInspectionsService {
    var getNewInspectionsResult: (successResponse: Inspection?, errorResponse: Error?) = (nil, MockInspectionError.getInspectionsFailed)
    var submitInspectionResult: Result<Void, Error> = .failure(MockInspectionError.submitInspectionFailed)
    
    func getNewInspections(completion: @escaping (Inspection?, Error?) -> Void) {
        completion(getNewInspectionsResult.successResponse, getNewInspectionsResult.errorResponse)
    }
    
    func submitInspection(inspection: Inspection, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(submitInspectionResult)
    }
}
