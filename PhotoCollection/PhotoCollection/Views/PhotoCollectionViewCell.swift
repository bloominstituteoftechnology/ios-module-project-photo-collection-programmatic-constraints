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
            updateViews()
        }
    }
    var photoImageView = UIImageView()
    var photoTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        photoTitleLabel.text = photo.title
    }
    
    func setUpViews() {
        // Set tranlatesautoresizingmasksintoconstraints to false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Set subview modes and add to view
        photoImageView.contentMode = .scaleAspectFit
        photoTitleLabel.textAlignment = .center
        addSubview(photoImageView)
        addSubview(photoTitleLabel)
        
        // Image View
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
                           constant: -4).isActive = true
        NSLayoutConstraint(item: photoImageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Label
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
