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
           setUpSubViews()
       }

    func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
  func setUpSubViews() {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Select the theme you would like to use"
      label.textAlignment = .center
      view.addSubview(label)
      label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
      label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -20).isActive = true
      label.heightAnchor.constraint(equalTo: label.heightAnchor, constant: 38).isActive = true
      label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    
    let button1 = UIButton()
    button1.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button1)
    button1.setTitle("Dark", for: .normal)
    button1.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 20).isActive = true
    button1.widthAnchor.constraint(equalToConstant: 187).isActive = true
    button1.heightAnchor.constraint(equalToConstant: 30).isActive = true
    button1.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 0).isActive = true
  }
   
}
