//
//  UILoading.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import UIKit
import MBProgressHUD

class UILoading: NSObject {
    static func show(with view: UIView, animated: Bool = true) {
        MBProgressHUD.showAdded(to: view, animated: animated)
    }
    
    static func hide(with view: UIView, animated: Bool = true) {
        MBProgressHUD.hide(for: view, animated: animated)
    }
}
