//
//  UserListVM.swift
//  Case
//
//  Created by mba on 22.09.2024.

import Foundation
import Alamofire

class UserListVM {
    
    static let shared = UserListVM()
    
    private init() {}
     
    func fetchUserList(completion: @escaping (Result<[User], AFError>) -> Void) {
        
        NetworkManager.shared.request(
            endpoint: Config.baseUrl,
            method: .get
        ) { (result: Result<[User], AFError>) in
            completion(result)
        }
    }
}
