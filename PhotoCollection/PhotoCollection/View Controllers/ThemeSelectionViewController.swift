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
    
    private func setUpSubviews() {
        
        //Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select a theme preference."
        view.addSubview(label)
        
        let labelCenterXConstraint = label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let labelTopConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        
        //Dark Button
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        let darkTopConstraint = darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        
        let darkTrailingConstraint = darkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        
        let blueTopConstraint = blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        
        let blueLeadingConstraint = blueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100)
        
        
        NSLayoutConstraint.activate([labelCenterXConstraint, labelTopConstraint, darkTopConstraint, darkTrailingConstraint, blueTopConstraint, blueLeadingConstraint])
    }
    
    var themeHelper: ThemeHelper?
}
