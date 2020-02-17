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
    
    @objc func selectYellowTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    func setUpSubviews() {
        let label: UILabel = {
           let lb = UILabel()
            lb.text = "Change theme color "
            lb.font = lb.font.withSize(30)
            return lb
        }()
        
        let button: UIButton = {
            let button = UIButton()
            button.setTitle("Dark", for: .normal)
            button.backgroundColor = .gray
            button.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
            return button
        }()
     
        
        let secondButton : UIButton = {
            let bt = UIButton()
            bt.setTitle("Light", for: .normal)
            bt.setTitleColor(.black, for: .normal)
            bt.addTarget(self, action: #selector(selectYellowTheme), for: .touchUpInside)
            bt.backgroundColor = .yellow
            return bt
        }()
        
        
        let buttonStackView : UIStackView  = {
            let stackView = UIStackView(arrangedSubviews: [button,secondButton])
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.axis = .horizontal
         
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
      
        
        let verticalStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [buttonStackView,label])
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.axis = .vertical
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        view.addSubview(verticalStackView)
        verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let heartImage : UIImageView = {
           let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            img.image = UIImage(systemName: "heart")
            img.tintColor = .red
            return img
        }()
        view.addSubview(heartImage)
        
        NSLayoutConstraint.activate([
            
            heartImage.bottomAnchor.constraint(equalTo: verticalStackView.topAnchor,constant: -50),
            heartImage.heightAnchor.constraint(equalToConstant: 240),
            heartImage.widthAnchor.constraint(equalToConstant: 240),
            heartImage.centerXAnchor.constraint(equalTo: verticalStackView.centerXAnchor)
        
        ])
        
    }
    
    
    var themeHelper: ThemeHelper?
}
