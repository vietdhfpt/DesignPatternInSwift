//
//  EmployeePresenter.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import Foundation

protocol EmployeeViewPresenter: class {
    func showEmployees()
}

class EmployeePresenter: EmployeeViewPresenter {
    unowned var viewProxy: EmployeeViewProxy
    private let service: APIService
    
    init(view: EmployeeViewProxy) {
        self.viewProxy = view
        self.service = APIService()
    }
    
    func showEmployees() {
        service.getEmployeeData { employees in
            self.viewProxy.setEmployees(employees: employees.data)
        }
    }
}
