//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var photo: Photo?
    
    private var imageView: UIImageView!
    
    func setUpSubviews() {
        
        // Create an image view that will display the UIImage that the photo.imageData contains.
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
        
        NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 4).isActive = true
        
        NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -4).isActive = true
        
        NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 4).isActive = true
        
        self.imageView = imageView
        
        //Create a label that will display the Photo's title.

        
    }
    
}
