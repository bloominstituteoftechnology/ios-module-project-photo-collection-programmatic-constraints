//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import SwiftUI

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - Properties
    
    @UseAutoLayout private var themeSelectionLabel = UILabel()
    @UseAutoLayout private var themeSelector = UISegmentedControl(items: ["Dark", "Blue"])
    
    var themeHelper: ThemeHelper?
    
    
    // MARK: - Private
    
    private func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        setTheme()
    }
    
    private func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        setTheme()
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = UIColor(white: 0.1, alpha: 1)
            themeSelector.selectedSegmentIndex = 0
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
            themeSelector.selectedSegmentIndex = 1
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
    
    private func setUpSubviews() {
    
        themeSelectionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        themeSelectionLabel.textColor = .white
        themeSelectionLabel.text = "Select a Theme"
        
        themeSelector.backgroundColor = .lightGray
        themeSelector.selectedSegmentIndex = 0
        themeSelector.addTarget(self, action: #selector(themeSelected(_:)), for: .valueChanged)

        
        let stackView = UIStackView(arrangedSubviews: [themeSelectionLabel, themeSelector])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        
    }
    
    // MARK: - Action Handler
    
    @objc private func themeSelected(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            selectDarkTheme()
        } else {
            selectBlueTheme()
        }
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setTheme()
    }
}




// MARK: - SwiftUI Preview

struct ThemeSelectionWrapper: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ThemeSelectionWrapper>) -> UIView {
        return ThemeSelectionViewController().view
    }
    
    func updateUIView(_ uiView: ThemeSelectionWrapper.UIViewType, context: UIViewRepresentableContext<ThemeSelectionWrapper>) {
    }
}

struct ThemeSelectionWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelectionWrapper().background(Color.init(UIColor(white: 0.1, alpha: 1)))
    }
}
