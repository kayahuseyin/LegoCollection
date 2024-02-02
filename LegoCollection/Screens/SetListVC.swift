//
//  SetListVC.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 1.02.2024.
//

import UIKit

class SetListVC: UIViewController {

    var themaName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getSets { sets, errorMessage in
            guard let sets = sets else {
                print(sets)
                print(errorMessage)
                self.presentLCAlertOnMainThread(title: "Bad stuff happened", message: "olmadi be knk", buttonTitle: "OK")
                return
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
}
