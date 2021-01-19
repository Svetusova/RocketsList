//
//  RocketsListTests.swift
//  RocketsListTests
//
//  Created by Svetlana Matusova on 17.01.21.
//

import XCTest
@testable import RocketsList

class RocketsListViewModelTests: XCTestCase {

    var sut: RocketsListViewModel!
    var networkService: NetworkServiceProtocol!

    override func setUp() {
        networkService = NetworkServiceMock()
        sut = RocketsListViewModel(networkService: networkService)
    }

    override func tearDown() {
        networkService = nil
        sut = nil
    }

    func testFetchRockets() {
        let expectationFetchRockets = expectation(description: "fetch Rockets")
        
        sut.fetchRockets { success, error  in
            if success {
                expectationFetchRockets.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testRocketsCount() {
        let expectationRocketsCount = expectation(description: "Rockets count")
        
        sut.fetchRockets { success, error  in
            if success {
                expectationRocketsCount.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3) { [weak self] _ in
            XCTAssertEqual(self?.sut.rocketsCount, 4)
        }
    }
    
    func testGetRocketByIndex() {
        let expectationGetRocketByIndex = expectation(description: "get Rocket by index")
        
        sut.fetchRockets { success, error  in
            if success {
                expectationGetRocketByIndex.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3) { [weak self] _ in
            let rocket = self?.sut.rocket(by: 0)
            
            XCTAssertNotNil(rocket)
        }
    }
}
