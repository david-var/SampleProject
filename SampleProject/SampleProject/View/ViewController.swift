//
//  ViewController.swift
//  SampleProject
//
//  Created by David on 11/8/18.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController {
    
    
    @IBOutlet weak var cityNameField: UITextField!
    @IBOutlet weak var dataTableView: UITableView!
    lazy var viewModel: WeatherViewModel = {
        return WeatherViewModel()
    }()
    private let bag = DisposeBag()
    var cellId = "weatherCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataTableView.dataSource = self
        dataTableView.delegate = self
        cityNameField.delegate = self
        
        initView()
        initVM()
        setupBindings()
    }
    
    private func initView() {
        dataTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    // init View Model
    private func initVM() {
        
        viewModel.reloadViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.dataTableView.reloadData()
            }
        }
        
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    UIAlertController.presentInfoAlert(self!, message: message, title: "Info")
                }
            }
        }
        
        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.showActivityIndicator()
                }else {
                    self?.hideActivityIndicator()
                }
            }
        }
        
        viewModel.initFetch()
    }
    
    func setupBindings() {
        cityNameField.rx.text.orEmpty.bind(to: (viewModel.currentCityName)).disposed(by: bag)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherTableViewCell
        
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        let temp: Int =  Conversions.fahrenheitToCelsius(tempInF: cellVM.associatedData?.main.temp ?? 0)
        let date:String =  cellVM.associatedData?.dt_txt ?? ""
        cell.tempLbl.text = "\(temp) C"
        cell.dateLbl.text = " \(date)"
        cell.descriptionLbl.text = cellVM.associatedData?.weather.first?.description
        cell.weatherImg.image = UIImage.init(named: cellVM.associatedData?.weather.first?.getWeatherIconName() ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        let detailsVC = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        detailsVC.viewModel = cellVM
        
        self.navigationController!.pushViewController(detailsVC, animated: true)
    }

}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if cityNameField .isEqual(textField) {
            // search for new city
            viewModel.initFetch()
            
        }
        return true
    }
}
