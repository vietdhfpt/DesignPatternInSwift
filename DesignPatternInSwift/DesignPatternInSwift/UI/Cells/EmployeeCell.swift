//
//  EmployeeCell.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        salaryLabel.text = ""
    }
    
    private func setupUI() {
        // Container view
        containerView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1)
        containerView.layer.cornerRadius = 8
        
        // Title label
        titleLabel.textColor = .black
        
        // Salary label
        salaryLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
}
