//
//  InspectionsService.swift
//  Tendable_iOSExercise
//
//  Created by Rohan Panchal on 06/06/24.
//

import Foundation

class InspectionsService {
    static let shared = InspectionsService()
    private let baseUrl = "http://localhost:5001"

    //
    // '/api/inspections/start' endpoint call..
    //
    func getNewInspections(completion: @escaping (InspectionsModel?, Error?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/api/inspections/start") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else { return }
                        
            do {
                let inspectionsResponse = try JSONDecoder().decode(InspectionsModel.self, from: data)
                print("inspections Response : \(inspectionsResponse)")

                completion(inspectionsResponse, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    //
    // '/api/inspections/submit' endpoint call..
    //
    func submitInspection(inspection: Inspection, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/api/inspections/submit") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["inspection": inspection]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard data != nil else { return }
            do {
                completion(.success(true))
            }
        }.resume()
    }
}
