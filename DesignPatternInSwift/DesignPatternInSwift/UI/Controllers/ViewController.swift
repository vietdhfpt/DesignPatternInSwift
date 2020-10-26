//
//  ViewController.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: EmployeeViewModel!
    private var dataSource: GenericDataSource<EmployeeCell, EmployeeData>!
    private let cell = "EmployeeCell"

    private func setupDefaultUI() {
        title = "Employees"
    }
    
    private func setupDefaultTableView() {
        tableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }

    private func viewModelUpdateUI() {
        UILoading.show(with: self.view)
        viewModel = EmployeeViewModel()
        viewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    private func updateDataSource() {
        dataSource = GenericDataSource(cellIdentifier: cell, data: viewModel.employees.data, configureCell: { (cell, model) in
            cell.titleLabel.text = model.employeeName
            cell.salaryLabel.text = String("$\(model.employeeSalary)")
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
            UILoading.hide(with: self.view)
        }
    }
}

// MARK: - Life cycles
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultTableView()
        setupDefaultUI()
        viewModelUpdateUI()
    }
}

