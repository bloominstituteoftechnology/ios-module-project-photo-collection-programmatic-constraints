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
    var themeLabel: UILabel!
    
    override func viewDidLoad() {
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
    
  func setUpSubViews() {
      let themeLabel = UILabel()
          themeLabel.text = "Select a theme."
          themeLabel.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(themeLabel)
                 
          themeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
                 themeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 self.themeLabel = themeLabel
          
          let darkThemeButton = UIButton(type: .system)
                darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
                darkThemeButton.setTitle("Dark", for: .normal)
                view.addSubview(darkThemeButton)
                
          darkThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 3).isActive = true
          
                darkThemeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
          darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
          
          let blueThemeButton = UIButton(type: .system)
                blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
                blueThemeButton.setTitle("Blue", for: .normal)
                view.addSubview(blueThemeButton)
                
            blueThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 3).isActive = true
          
                blueThemeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
          blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
          
    }
   
}
