//
//  WeatherViewModel.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation


class BaseTableViewModel<DataType, CellType, T> {
    
    var dataManager: T
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    public var updateViewClosure: (()->())?
    public var showAlertClosure: (()->())?
    public var updateLoadingStatus: (()->())?
    public var reloadViewClosure: (()->Void)?
    
    init(dataMngr: T ) {
        self.dataManager = dataMngr
    }
    
    
    // overide in inherited class
    // load data from Data Manager
    func initFetch() {
        preconditionFailure("This method must be overridden")
    }
    
    internal var data:[DataType] = [DataType]()
    internal var cellViewModels: [CellType] = [CellType]() {
        didSet {
            self.reloadViewClosure?()
        }
    }
    
    final var numberOfCells: Int {
        return cellViewModels.count
    }
    
    final func getCellViewModel( at indexPath: IndexPath ) -> CellType {
        return cellViewModels[indexPath.row]
    }
    
    //  overide in inherited class
    func processFetchedData( data: [DataType] ) {
        preconditionFailure("This method must be overridden")
    }
    
    
}
