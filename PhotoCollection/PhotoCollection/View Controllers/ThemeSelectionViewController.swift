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
        
        setUpSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpSubViews()
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
    
    func setUpSubViews() {
        
        let themeLabel = UILabel()
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.text = "Please Select Theme"
        
        view.addSubview(themeLabel)
        
        themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        let lightTheme = UIButton(type: .system)
        lightTheme.translatesAutoresizingMaskIntoConstraints = false
        lightTheme.setTitle("Light", for: .normal)
        lightTheme.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        
        // 2. Add to view hierarchy
        view.addSubview(lightTheme)
        
        let darkTheme = UIButton(type: .system)
        darkTheme.translatesAutoresizingMaskIntoConstraints = false
        darkTheme.setTitle("Dark", for: .normal)
        darkTheme.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        
        // 2. Add to view hierarchy
        view.addSubview(darkTheme)
        
        darkTheme.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        
    }
}


