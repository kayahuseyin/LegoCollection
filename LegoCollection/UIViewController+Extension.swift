//
//  UIViewController+Extension.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 1.02.2024.
//

import UIKit

extension UIViewController {
    
    func presentLCAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = LCAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
