//
//  WeatherViewModelTests.swift
//  SampleProjectTests
//
//  Created by David on 11/9/18.
//  Copyright © 2018 David. All rights reserved.
//

import XCTest
@testable import SampleProject

class WeatherViewModelTests: XCTestCase {

    var sut: WeatherViewModel!
    var mockDataManager: MockDataManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDataManager = MockDataManager()
        sut = WeatherViewModel.init(dataMngr: mockDataManager)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockDataManager = nil
        super.tearDown()
    }

    func testWeatherFetch() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // get fake data
        sut.initFetch()
        
        // Assert
        XCTAssert(mockDataManager!.isFetchDataCalled)
    }

    
    func test_loading_when_fetching() {
        
        //Given
        var loadingStatus = false
        let expect = XCTestExpectation(description: "Loading status updated")
        sut.updateLoadingStatus = { [weak sut] in
            loadingStatus = sut!.isLoading
            expect.fulfill()
        }
        
        //when fetching
        sut.initFetch()
        
        // Assert
        XCTAssertTrue( loadingStatus )
        
        
        wait(for: [expect], timeout: 1.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
