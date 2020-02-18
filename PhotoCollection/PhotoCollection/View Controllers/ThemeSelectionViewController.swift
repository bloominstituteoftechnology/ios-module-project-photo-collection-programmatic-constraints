//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubviews()
    }

    
    func setUpSubviews() {
           // Label
           let label = UILabel()
           label.text = "Select the theme you would like to use:"
           label.textAlignment = .center
           label.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(label)
           
           label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
           label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
           label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
           
           // Dark Button
           let darkButton = UIButton(type: .system)
           darkButton.setTitle("Dark", for: .normal)
           darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
           darkButton.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(darkButton)
           
           darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
           darkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
           
           // Blue Button
           let blueButton = UIButton(type: .system)
           blueButton.setTitle("Blue", for: .normal)
           blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
           blueButton.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(blueButton)
           
           blueButton.topAnchor.constraint(equalTo: darkButton.topAnchor).isActive = true
           blueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150).isActive = true
       }
    
    var themeHelper: ThemeHelper?
}
