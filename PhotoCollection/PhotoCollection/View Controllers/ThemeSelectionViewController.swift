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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
    }

    private func setUpSubviews() {

        // Headline Label
        let headline = UILabel()
        headline.translatesAutoresizingMaskIntoConstraints = false
        headline.text = "Photo Collection"
        headline.font = .preferredFont(forTextStyle: .largeTitle)
        
        view.addSubview(headline)

        headline.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        headline.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        // Direction Label
        let direction = UILabel()
        direction.translatesAutoresizingMaskIntoConstraints = false
        direction.text = "Select the theme you would like to use:"
        
        view.addSubview(direction)

        direction.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 10).isActive = true
        direction.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true


        // Dark Button
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)

        view.addSubview(darkButton)

        darkButton.topAnchor.constraint(equalTo: direction.bottomAnchor, constant: 20).isActive = true

        darkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        
        // Blue Button
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)

        view.addSubview(blueButton)

        blueButton.topAnchor.constraint(equalTo: direction.bottomAnchor, constant: 20).isActive = true

        blueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
    }
    
}
