//
//  InspectionsViewModel.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 06/06/24.
//

import Foundation

class InspectionsViewModel {
    var inspections: Inspection?
    var errorMessage: String?
    
    private let inspectionsService = InspectionsService.shared

    //Get Inspections API call..
    func getInspections(completion: @escaping (Bool) -> Void) {
        inspectionsService.getNewInspections { successResponse, errorResponse  in
            DispatchQueue.main.async {
                if let error = errorResponse {
                    self.errorMessage = error.localizedDescription
                    self.inspections = nil
                    completion(false)
                } else if let response = successResponse {
                    self.errorMessage = nil
                    self.inspections = response.inspection
                    completion(true)
                }
            }
        }
    }
    
    //Submit Inspections API call..
    func submitInspection(inspection: Inspection, completion: @escaping (Bool) -> Void) {
        inspectionsService.submitInspection(inspection: inspection) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.errorMessage = nil
                    completion(true)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    completion(false)
                }
            }
        }
    }
}
