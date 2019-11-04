//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var darkButton: UIButton!
    var blueButton: UIButton!
    
    var collectionVC: PhotoCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        collectionVC?.setTheme()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        collectionVC?.setTheme()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        let spacingConstant: CGFloat = 8
        
        let selectLabel = UILabel()
        view.addSubview(selectLabel)
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.text = "Select theme:"
        selectLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacingConstant * 2).isActive = true
        selectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        darkButton = UIButton(type: .system)
        view.addSubview(darkButton)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: spacingConstant).isActive = true
        darkButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -spacingConstant).isActive = true
        
        blueButton = UIButton(type: .system)
        view.addSubview(blueButton)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.topAnchor.constraint(equalTo: darkButton.topAnchor).isActive = true
        blueButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: spacingConstant).isActive = true
    }
}
