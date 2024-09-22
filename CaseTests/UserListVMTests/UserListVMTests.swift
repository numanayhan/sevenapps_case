//
//  UserListVMTests.swift
//  CaseTests
//
//  Created by mba on 22.09.2024.
//

import Foundation
import XCTest
@testable import Case

class UserListVMTests: XCTestCase {
    
    var viewModel: UserListVM!
    var mockRepository: MockUserRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockUserRepository()
        
        //viewModel = UserListVM(userRepository: nil) // Mock repository'yi inject ediyoruz
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testFetchUserListSuccess() {
        let expectation = XCTestExpectation(description: "Fetch user list successfully")
        
        viewModel.fetchUserList { result in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 2)
                XCTAssertEqual(users[0].name, "John Doe")
                XCTAssertEqual(users[1].email, "jane@example.com")
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchUserListFailure() {
        let expectation = XCTestExpectation(description: "Fetch user list failed")
        
        // Mock repository'de hata döndürmek için shouldReturnError'ı true yapıyoruz
        mockRepository.shouldReturnError = true
        
        viewModel.fetchUserList { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual((error as NSError).code, 404)
                XCTAssertEqual((error as NSError).localizedDescription, "Data not found")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
