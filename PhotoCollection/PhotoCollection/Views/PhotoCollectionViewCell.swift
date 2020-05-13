//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var photo: Photo? {
        didSet {
            setUpSubViews()
        }
    }
    
    
    private var photoImageView = UIImageView()
    private var photoTitleLabel = UILabel()
    
    private func setUpSubViews() {
        if let photo = photo {
            photoImageView = UIImageView(image: UIImage(data: photo.imageData))
            photoImageView.translatesAutoresizingMaskIntoConstraints = false
            photoImageView.contentMode = .scaleAspectFit
            
            addSubview(photoImageView)
            
            NSLayoutConstraint(item: photoImageView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1,
                               constant: 4).isActive = true
            
            NSLayoutConstraint(item: photoImageView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 4).isActive = true
            
            NSLayoutConstraint(item: photoImageView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 4).isActive = true
            
            NSLayoutConstraint(item: photoImageView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: photoImageView,
                               attribute: .width,
                               multiplier: 1,
                               constant: 0).isActive = true
            
            photoTitleLabel.text = photo.title
            photoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            photoTitleLabel.textAlignment = .center
            
            addSubview(photoTitleLabel)
            
            NSLayoutConstraint(item: photoTitleLabel,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: photoImageView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 4).isActive = true
            
            NSLayoutConstraint(item: photoTitleLabel,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 4).isActive = true
            
            NSLayoutConstraint(item: photoTitleLabel,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 4).isActive = true
            
        }
    }
    
    
}
