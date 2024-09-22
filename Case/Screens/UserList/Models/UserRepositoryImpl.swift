//
//  UserRepository.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import Foundation
import Alamofire

protocol UserRepository {
    func fetchUserList(completion: @escaping (Result<[User], Error>) -> Void)
}

class UserRepositoryImpl: UserRepository {
    
    func fetchUserList(completion: @escaping (Result<[User], Error>) -> Void) {
        
        NetworkManager.shared.request(
            endpoint: Config.baseUrl ,
            method: .get
        ) { (result: Result<[User], AFError>) in 
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
