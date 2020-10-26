//
//  APIService.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import Foundation

class APIService: NSObject {
    private let sourceUrl = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    internal func getEmployeeData(completion: @escaping (Employees) -> ()) {
        URLSession.shared.dataTask(with: self.sourceUrl) { (data, urlResponse, error) in
            guard let data = data else { return }
            do {
                let employeeData = try JSONDecoder().decode(Employees.self, from: data)
                completion(employeeData)
            } catch let err {
                print("Employee decode error: ", err.localizedDescription)
            }
        }.resume()
    }
}
