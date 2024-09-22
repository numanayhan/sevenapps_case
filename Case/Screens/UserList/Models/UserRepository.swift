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

