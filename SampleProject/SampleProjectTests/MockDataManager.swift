//
//  MockDataManager.swift
//  SampleProjectTests
//
//  Created by David on 11/9/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
import SwiftyJSON
@testable import SampleProject



class MockDataManager : DataManagerProtocol {
    
    var isFetchDataCalled = false
    var json: JSON = JSON()
    var failCB: FailureCallback?
    var successCB: SuccessCallback?
    
    
    func getData(  params: [String : String], fail: @escaping FailureCallback, success: @escaping SuccessCallback )-> Void {
        
        isFetchDataCalled = true
        
        DispatchQueue.global().async {
            let path = Bundle.main.path(forResource: "content", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let json = try! JSON(data: data)
            success(json)
        }
    }
    
    
}
