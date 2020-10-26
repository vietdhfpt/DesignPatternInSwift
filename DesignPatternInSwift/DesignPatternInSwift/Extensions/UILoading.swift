//
//  UILoading.swift
//  DesignPatternInSwift
//
//  Created by Gia Han on 10/26/20.
//

import UIKit
import MBProgressHUD

//protocol LoadingIndicatorPresentable {
//    var progressView: MBProgressHUD? { get }
//    func showLoading()
//    func hideLoading()
//}
//
//extension LoadingIndicatorPresentable where Self: UIViewController {
//    func showLoading() {
//        progressView?.show(animated: true)
//    }
//
//    func hideLoading() {
//        progressView?.hide(animated: true)
//    }
//}

class UILoading: NSObject {
    static func show(with view: UIView, animated: Bool = true) {
        MBProgressHUD.showAdded(to: view, animated: animated)
    }
    
    static func hide(with view: UIView, animated: Bool = true) {
        MBProgressHUD.hide(for: view, animated: animated)
    }
}
