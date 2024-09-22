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
        
        // Mock repository'yi oluşturuyoruz
        mockRepository = MockUserRepository()
        
        // guard ile mockRepository'nin nil olmadığını kontrol ediyoruz
        guard let mockRepository = mockRepository else {
            XCTFail("MockUserRepository could not be initialized")
            return
        }
        
         
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testFetchUserListSuccess() {
        let expectation = XCTestExpectation(description: "Fetch user list successfully")
        
        // Başarılı veri çekme testi
        viewModel.fetchUserList { result in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 2) // 2 kullanıcı dönmeli
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
        
        // Hata testi için mockRepository'de hata döndüreceğiz
        mockRepository.shouldReturnError = true
        
        // Hata testi
        viewModel.fetchUserList { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual((error as NSError).code, 404) // Hata kodu 404 olmalı
                XCTAssertEqual((error as NSError).localizedDescription, "Data not found") // Hata mesajı doğru olmalı
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
