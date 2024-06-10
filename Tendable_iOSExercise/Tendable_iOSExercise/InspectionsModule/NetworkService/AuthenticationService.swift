//
//  AuthenticationService.swift
//  Tendable_iOSExcerise
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation

class UserService {
    static let shared = UserService()
    private let baseUrl = "http://localhost:5001"

    //
    // '/api/login' endpoint call..
    //
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/api/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email, "password": password]
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

    //
    // '/api/register' endpoint call..
    //
    func register(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/api/register") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let registrationResponse = try JSONDecoder().decode(User.self, from: data)
                completion(.success(registrationResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
