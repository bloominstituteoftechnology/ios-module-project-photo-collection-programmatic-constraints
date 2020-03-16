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
    @UseAutoLayout private var themeSelector = UISegmentedControl()
    
    var themeHelper: ThemeHelper?
    
    
    // MARK: - Private
    
    private func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    private func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = UIColor(white: 0.1, alpha: 1)
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        ThemeSelectionWrapper()
    }
}
