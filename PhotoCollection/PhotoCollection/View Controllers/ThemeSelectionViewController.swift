//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol SettingsDelegate {
    func settingsWereUpdated()
}

class ThemeSelectionViewController: UIViewController {
    
    var delegate: SettingsDelegate!
    
    init(with delegate: SettingsDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate.settingsWereUpdated()
    }
    
    // MARK: - Action Handlers
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    // MARK: - Private
    
    private func setUpSubviews() {
        let themeLabel = UILabel()
        let blueThemeButton = UIButton(type: .system)
        let darkThemeButton = UIButton(type: .system)
        
        themeLabel.text = "Select Your Theme Below"
        themeLabel.textAlignment = .center
        
        view.addSubview(themeLabel)
        
        view.addSubview(blueThemeButton)
        
        view.addSubview(darkThemeButton)
        
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        themeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4).isActive = true
        
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark Theme", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        darkThemeButton.topAnchor.constraint(equalTo: themeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 40).isActive = true
        darkThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        //        darkThemeButton.trailingAnchor.constraint(equalTo: blueThemeButton.safeAreaLayoutGuide.leadingAnchor, constant: -10).isActive = true
        
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue Theme", for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        blueThemeButton.topAnchor.constraint(equalTo: themeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 40).isActive = true
        //        blueThemeButton.leadingAnchor.constraint(greaterThanOrEqualTo: darkThemeButton.trailingAnchor, constant: 40).isActive = true
        blueThemeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
    }
}
