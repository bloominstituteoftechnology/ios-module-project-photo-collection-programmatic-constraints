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
    private var photoLabel = UILabel()

    var photo: Photo?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        
        // Y position
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 10).isActive = true
        
        // X position
        
       NSLayoutConstraint(item: imageView,
                          attribute: .leading,
                          relatedBy: .equal,
                          toItem: self,
                          attribute: .leading,
                          multiplier: 1,
                          constant: 10).isActive = true
        
        // width / negative / left / trailing
        
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -10).isActive = true
        
        // height
        
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.textAlignment = .center
        addSubview(photoLabel)
        
        NSLayoutConstraint(item: photoLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: photoLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0).isActive = true
        
    func updateViews() {
           guard let photo = photo else { return }
            imageView.image = UIImage(data: photo.imageData)
            photoLabel.text = photo.title
        }
    }
    
}
