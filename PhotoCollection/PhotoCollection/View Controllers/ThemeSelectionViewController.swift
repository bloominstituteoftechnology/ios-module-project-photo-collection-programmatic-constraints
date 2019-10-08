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
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    private func setSubviews() {
        let selectThemeLabel = UILabel()
        let darkButton = UIButton()
        let blueButton = UIButton()
        
        view.addSubview(selectThemeLabel)
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        selectThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectThemeLabel.text = "Select Theme"
        darkButton.titleLabel?.text = "Dark"
        blueButton.titleLabel?.text = "Blue"
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
//        NSLayoutConstraint(item: <#T##Any#>,
//                           attribute: <#T##NSLayoutConstraint.Attribute#>,
//                           relatedBy: <#T##NSLayoutConstraint.Relation#>,
//                           toItem: <#T##Any?#>,
//                           attribute: <#T##NSLayoutConstraint.Attribute#>,
//                           multiplier: <#T##CGFloat#>,
//                           constant: <#T##CGFloat#>)
    
        
    }
}
