//
//  LCPickerView.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 1.02.2024.
//

import UIKit

class LCPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var themes: [String] = ["BrickHeadz", "Art", "Technic"]
    var selectedTheme: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
        
        selectedTheme = themes.first // App ilk defa acildiginda pickerView'a hic dokunulmazsa gecis bos oluyordu.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(themas: [String]) {
        self.init(frame: .zero)
        self.themes = themas
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTheme = themes[row]
    }
    
}
