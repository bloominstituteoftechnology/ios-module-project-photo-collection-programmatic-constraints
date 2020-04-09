//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: -Properties-
    var photo: Photo? {
        didSet {
            setUpSubviews()
        }
    }
    
    //MARK: -Methods-
    func setUpSubviews() {
        guard let photo = photo else {return}
        
        let imageView: UIImageView = UIImageView(image: UIImage(data: photo.imageData))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        let label = UILabel()
        label.text = photo.title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 0,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 0,
                           constant: -2).isActive = true
        
        //        NSLayoutConstraint(item: label,
        //                           attribute: .bottom,
        //                           relatedBy: .equal,
        //                           toItem: self,
        //                           attribute: .bottom,
        //                           multiplier: 1,
        //                           constant: 0).isActive = true
        
    }
    
}
