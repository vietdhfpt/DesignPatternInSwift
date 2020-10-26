//
//  Employees.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import Foundation

struct Employees: Codable {
    let status: String
    let data: [EmployeeData]
    let message: String
}

struct EmployeeData: Codable {
    let id: Int
    let employeeSalary, employeeAge: Double
    let employeeName, profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
