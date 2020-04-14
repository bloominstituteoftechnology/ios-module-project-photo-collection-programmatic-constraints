//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    
    
    private func setUpSubviews() {
        // Label
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select the theme you would like to use."
        
        // Two buttons
        
        let selectDarkThemeButton = UIButton(type: .system)
        selectDarkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        selectDarkThemeButton.setTitle("Dark", for: .normal)
        selectDarkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        let selectBlueThemeButton = UIButton(type: .system)
        selectBlueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        selectBlueThemeButton.setTitle("Blue", for: .normal)
        selectBlueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        // Add to subview
        view.addSubview(label)
        view.addSubview(selectDarkThemeButton)
        view.addSubview(selectBlueThemeButton)
        
        
        // constrain
        
        
        
        
    }
}
