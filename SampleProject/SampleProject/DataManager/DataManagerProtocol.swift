//
//  DataManagerProtocol.swift
//  MapBoxSample
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
import SwiftyJSON


typealias FailureCallback = (_ errorCode: Int?, _ message: String?) -> Void
typealias SuccessCallback = (_ json: JSON) -> Void

// gives ability to change implementaion and keep flexiblity.
// data can be returned from server or local db, user will be not aware of implementation
protocol DataManagerProtocol {
    func getData(  params: [String : String], fail: @escaping FailureCallback, success: @escaping SuccessCallback )-> Void
}
