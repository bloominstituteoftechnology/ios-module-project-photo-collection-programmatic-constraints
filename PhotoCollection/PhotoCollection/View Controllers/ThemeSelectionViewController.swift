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
    
    var themeHelper: ThemeHelper? {
        didSet {
            setUpSubviews()
        }
    }
    var selectThemeLabel = UILabel()
    var blueButton = UIButton()
    var darkButton = UIButton()
    
    
    func setUpSubviews() {
        let width = view.safeAreaLayoutGuide.layoutFrame.size.width - 16.0
        
        selectThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        // setup elements and add to view
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.setTitle("Blue", for: .normal)
        darkButton.setTitle("Dark", for: .normal)
        selectThemeLabel.text = "Select a theme"
        view.addSubview(blueButton)
        view.addSubview(darkButton)
        view.addSubview(selectThemeLabel)
        
        // selectThemeLabel constraints
        selectThemeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        selectThemeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

         //blueButton constraints
        blueButton.topAnchor.constraint(equalTo: selectThemeLabel.bottomAnchor, constant: 20).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        blueButton.frame.size.width = 1.0/3.0 * width
        blueButton.frame.size.height = 30
        blueButton.setTitleColor(.black, for: .normal)
        
        //darkButton constraints
        darkButton.topAnchor.constraint(equalTo: blueButton.bottomAnchor, constant: 20).isActive = true
        darkButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        darkButton.frame.size.width = 1.0/3.0 * width
        darkButton.frame.size.height = 30
        darkButton.setTitleColor(.black, for: .normal)
        
    }
}
