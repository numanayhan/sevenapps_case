//
//  MockUserRepository.swift
//  CaseTests
//
//  Created by mba on 22.09.2024.
//

import Foundation

class MockUserRepository: UserRepository {
    
    var shouldReturnError = false
    
    func fetchUserList(completion: @escaping (Result<[User], Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Data not found"])
            completion(.failure(error))
        } else {
            let mockUsers = [
                User(name: "John Doe", email: "john@example.com", phone: "123-456-7890", website: "johndoe.com"),
                User(name: "Jane Smith", email: "jane@example.com", phone: "987-654-3210", website: "janesmith.com")
            ]
            completion(.success(mockUsers))
        }
    }
}
