//
//  SearchVC.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 1.02.2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let pickerView = LCPickerView() // API'den cekilecek mi?
    let callToActionButton = LCButton(backgroundColor: Constants.legoRed ?? .systemRed , title: "Get Sets")
    
    var isThemeSelected: Bool { return pickerView.selectedTheme != nil && !pickerView.selectedTheme!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configurePickerView()
        configureCallToActionButton()
    }
    
    
    @objc func pushSetListVC() {
        guard isThemeSelected else {
            presentLCAlertOnMainThread(title: "Theme Not Selected", message: "Please Select a Theme", buttonTitle: "OK")
            return
        }
        let setListVC = SetListVC()
        setListVC.themaName = pickerView.selectedTheme
        setListVC.title = pickerView.selectedTheme
        navigationController?.pushViewController(setListVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
        
        NSLayoutConstraint.activate([
                    logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
                    logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    logoImageView.heightAnchor.constraint(equalToConstant: 200),
                    logoImageView.widthAnchor.constraint(equalToConstant: 200)
                ])
    }
    
    
    func configurePickerView() {
        view.addSubview(pickerView)
        //pickerView.delegate = self  //Secilen themaya gore arama yapilacagi icin eklemem gerekebilir
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            pickerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushSetListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


/*
 extension SearchVC: UIPickerViewDelegate {
     // Secilen pickerView degerine gore API'den data cekilecek o yuzcen I guess we need the delegate
 }
 */

