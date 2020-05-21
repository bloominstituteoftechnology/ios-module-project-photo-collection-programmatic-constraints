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
    
    private func setUpSubviews(){
//        Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Select Theme: "
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //Button 1 (Theme Dark)
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        self.view.addSubview(darkButton)
        darkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 150).isActive = true
        
        //Button 2 (Theme Blue)
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        blueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 150).isActive = true
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
}
