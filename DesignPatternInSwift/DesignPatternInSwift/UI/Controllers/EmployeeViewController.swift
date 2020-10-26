//
//  EmployeeViewController.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import UIKit
import MBProgressHUD

class EmployeeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: EmployeePresenter!
    private var dataSource: GenericDataSource<EmployeeCell, EmployeeData>!
    private let cell = "EmployeeCell"

    private func setupDefaultUI() {
        title = "Employees"
    }
    
    private func setupDefaultTableView() {
        tableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
    }
    
    private func setupPresenter() {
        presenter = EmployeePresenter(view: self)
        
        // Get employee
        getEmployees()
    }

    private func getEmployees() {
        UILoading.show(with: self.view)
        presenter.showEmployees()
    }
}

// MARK: - Life cycles
extension EmployeeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultTableView()
        setupDefaultUI()
        setupPresenter()
    }
}

// MARK : - EmployeeViewProxy
extension EmployeeViewController: EmployeeViewProxy {
    func setEmployees(employees: [EmployeeData]) {
        dataSource = GenericDataSource(cellIdentifier: cell, data: employees, configureCell: { (cell, model) in
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

