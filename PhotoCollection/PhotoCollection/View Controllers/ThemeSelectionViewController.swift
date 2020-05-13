//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ThemeDelegate {
    func themeSelected()
}

class ThemeSelectionViewController: UIViewController {
    
    var delegate: ThemeDelegate?
    
//    init(with delegate: ThemeDelegate) {
//        self.delegate = delegate
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let firstVC = presentingViewController as? PhotoCollectionViewController? {
            DispatchQueue.main.async {
                firstVC?.collectionView.reloadData()
            }
        }
    }

    @objc func selectDarkTheme() {
        if let themeHelper = self.themeHelper, let delegate = self.delegate {
            themeHelper.setThemePreferenceToDark()
            delegate.themeSelected()
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        if let themeHelper = self.themeHelper, let delegate = self.delegate {
            themeHelper.setThemePreferenceToBlue()
            delegate.themeSelected()
        }
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select a theme"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        darkButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -60).isActive = true
        
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 60).isActive = true
    }
}
