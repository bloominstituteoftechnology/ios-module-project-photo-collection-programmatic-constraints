//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    //Objects
    var buttonDark: UIButton?
    var buttonBlue: UIButton?
    
    
    override func viewDidLoad() {
        updateViews()
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
    
    func updateViews() {
        
        //Adding Button
        buttonDark = UIButton(type: .system)
        buttonBlue = UIButton(type: .system)
        
        guard let buttonDark = buttonDark, let buttonBlue = buttonBlue else { return }
        
        view.addSubview(buttonDark)
        view.addSubview(buttonBlue)
        
        buttonDark.setTitle("Dark", for: .normal)
        buttonBlue.setTitle("Blue", for: .normal)
        buttonDark.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        buttonBlue.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        buttonDark.translatesAutoresizingMaskIntoConstraints = false
        buttonBlue.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        let buttonX = NSLayoutConstraint(item: buttonDark, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let buttonY = NSLayoutConstraint(item: buttonDark, attribute: .centerY, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([buttonX, buttonY])
        
        let otherX = NSLayoutConstraint(item: buttonBlue, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let otherY = NSLayoutConstraint(item: buttonBlue, attribute: .bottom, relatedBy: .equal, toItem: buttonDark, attribute: .bottom, multiplier: 1.0, constant: 30)
        
        NSLayoutConstraint.activate([otherX, otherY])
    }
    
    
}
