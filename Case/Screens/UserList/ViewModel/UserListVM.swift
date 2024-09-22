//
//  UserListVM.swift
//  Case
//
//  Created by mba on 22.09.2024.

import Foundation
import Alamofire

public class UserListVM {
    let userRepository: UserRepository
    init(userRepository: UserRepository = UserRepositoryImpl()) {
        self.userRepository = userRepository
    } 
    func fetchUserList(completion: @escaping (Result<[User], Error>) -> Void) {
        userRepository.fetchUserList { result in
            completion(result)
        }
    }
}
