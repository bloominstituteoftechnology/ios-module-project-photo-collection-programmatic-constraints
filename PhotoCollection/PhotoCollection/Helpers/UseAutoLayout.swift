//
//  UseAutoLayout.swift
//  PhotoCollection
//
//  Created by Shawn Gee on 3/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

@propertyWrapper
struct UseAutoLayout<T: UIView> {
    var wrappedValue: T { didSet { setAutoLayout() }}
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }
    
    func setAutoLayout() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
