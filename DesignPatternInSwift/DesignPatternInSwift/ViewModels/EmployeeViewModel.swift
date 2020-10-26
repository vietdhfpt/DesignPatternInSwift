//
//  EmployeeViewModel.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import Foundation

class EmployeeViewModel: NSObject {
    private var apiService: APIService!
    private(set) var employees: Employees! {
        didSet {
            self.bindEmployeeViewModelToController?()
        }
    }
    
    internal var bindEmployeeViewModelToController: (() -> ())?
    
    override init() {
        super.init()
        self.apiService = APIService()
        getEmployees()
    }
    
    private func getEmployees() {
        self.apiService.getEmployeeData { data in
            self.employees = data
        }
    }
}
