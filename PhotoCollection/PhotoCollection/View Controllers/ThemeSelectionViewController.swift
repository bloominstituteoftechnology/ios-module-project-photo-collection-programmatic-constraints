//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

   @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
   @objc func selectSiennaTheme() {
        themeHelper?.setThemePreferenceToSienna()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        let setThemeLabel = UILabel()
        let darkThemeButton = UIButton()
        
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        let burntSiennaButton = UIButton()
        burntSiennaButton.setTitle("Sienna", for: .normal)
        burntSiennaButton.addTarget(self, action: #selector(selectSiennaTheme), for: <#T##UIControl.Event#>)
        
        
    }
}
