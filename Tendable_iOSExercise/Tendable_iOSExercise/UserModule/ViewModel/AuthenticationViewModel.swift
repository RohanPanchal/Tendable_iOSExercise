//
//  AuthenticationViewModel.swift
//  Tendable_iOSExcerise
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation

class AuthenticationViewModel {
    var user: User?
    var errorMessage: String?
    
    private let userService = UserService.shared

    //Login API call..
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        userService.login(email: email, password: password) { result in
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

    //Registration API call..
    func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        userService.register(email: email, password: password) { result in
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
