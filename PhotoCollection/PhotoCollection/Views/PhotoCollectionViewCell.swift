//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private var imageView = UIImageView()
    private var titleLabel = UILabel()
    
    var photo: Photo?
    
    private func setUpSubviews() {
        
        // 1. create/configure subview
        // always put to false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // like a frame for a picture..
        imageView.contentMode = .scaleAspectFit
        
        // 2. add subview to view hierarchy
        addSubview(imageView)
        
        // 3. create constraints
        // This is the y constraint
        // everything in ios is positioned from the upper left corner
        // cell - is a container to hold views
        
        
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 2)
        
        // This is the x constraint
               let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                             attribute: .leading,
                                                             relatedBy: .equal,
                                                             toItem: self,
                                                             attribute: .leading,
                                                             multiplier: 1.0,
                                                             constant: 4)
               
               // This is the width constraint
               let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                                 attribute: .trailing,
                                                                 relatedBy: .equal,
                                                                 toItem: self,
                                                                 attribute: .trailing,
                                                                 multiplier: 1.0,
                                                                 constant: -4)
               
               // This is the height constraint (aspect ratio)
               let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                                  attribute: .height,
                                                                  relatedBy: .equal,
                                                                  toItem: imageView,
                                                                  attribute: .width,
                                                                  multiplier: 1.0,
                                                                  constant: 0)
               
               // 4. activate constraints
               NSLayoutConstraint.activate([imageViewXConstraint,
                                            imageViewYConstraint,
                                            imageViewWidthConstraint,
                                            imageViewHeightConstraint])
        
        
    }
}
