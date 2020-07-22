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
    private var nameLabel = UILabel()

    var photo: Photo?
    
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = photo.imageData
        
    }
    func setUpSubViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        // This is the y
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
        
        // This is the x
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        // This is the width
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        // This is the height
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
}
