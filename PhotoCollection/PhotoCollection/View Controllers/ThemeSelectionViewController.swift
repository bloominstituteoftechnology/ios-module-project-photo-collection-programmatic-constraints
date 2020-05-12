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
        let darkThemeButton = UIButton(type: .system)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark Theme", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkThemeButton)
        
        let blueThemeButton = UIButton(type: .system)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue Theme", for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueThemeButton)
    }
}
