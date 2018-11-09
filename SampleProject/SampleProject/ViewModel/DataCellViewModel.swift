//
//  DataCellViewModel.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation


struct DataCellViewModel<DataType> {
    var associatedData: DataType?
    
    init (data: DataType) {
        self.associatedData = data
    }
        
    
}
