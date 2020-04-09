//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        setupSubViews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    func setupSubViews() {
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select a Theme"
        view.addSubview(label)
        let labelTopAnchor = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        let labelXAnchor = label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        
        // Dark Button
        let darkButton = UIButton()
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        view.addSubview(darkButton)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        let darkButtonTopConstraint = darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30)
        let darkButtonTrailingConstraint = darkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10)
        
        let blueButton = UIButton()
             blueButton.translatesAutoresizingMaskIntoConstraints = false
             blueButton.setTitle("Blue", for: .normal)
             view.addSubview(blueButton)
             blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
             let blueButtonTopConstraint = blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30)
        let blueButtonLeadingConstraint = blueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10)
        
        NSLayoutConstraint.activate([labelTopAnchor, labelXAnchor,darkButtonTopConstraint, darkButtonTrailingConstraint, blueButtonTopConstraint, blueButtonLeadingConstraint])
    }
    
}
