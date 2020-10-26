//
//  GenericDataSource.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import UIKit

class GenericDataSource<CellType: UITableViewCell, DataType>: NSObject, UITableViewDataSource {
    private var cellIdentifier: String
    private var data: [DataType]
    internal var configureCell: ((CellType, DataType) -> ())?
    
    init(cellIdentifier: String, data: [DataType], configureCell: @escaping (CellType, DataType) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.data = data
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Can not dequeue cell with type: \(String(describing: CellType.self))")
        }
        let item = self.data[indexPath.row]
        self.configureCell?(cell, item)
        return cell
    }
}
