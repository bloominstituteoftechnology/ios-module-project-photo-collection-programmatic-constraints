//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var photoTitleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            setUpSubviews()
        }
    }
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        setUpSubviews()
    //    }
    
    
    private func setUpSubviews() {
        // Image View
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        addSubview(imageView)
        
        
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 6).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 6).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -6).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Label
        photoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        photoTitleLabel.textAlignment = .center
        addSubview(photoTitleLabel)
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
    }
    
    
    func updateViews() {
        photoTitleLabel.text = photo?.title
        
        let imageFromData = UIImage(named: "\(photo?.imageData)")
        let image = UIImageView(image: imageFromData)
        imageView = image
    }
}
