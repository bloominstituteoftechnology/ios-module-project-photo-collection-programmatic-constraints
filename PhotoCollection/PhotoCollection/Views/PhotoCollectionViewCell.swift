//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    var photo: Photo? {
        didSet {
            //Creates UIImage Subview and adds it to the cell's contentView.
            contentView.addSubview(imageView)
            setupSubviews()
            updateViews()
        }
    }
    
    func setupSubviews() {
        //Setup constraints for imageView within cell's contentView
        let imageViewConstraints = [
            NSLayoutConstraint(item: imageView, attribute: .topMargin, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: imageView, attribute: .leadingMargin, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: imageView, attribute: .trailingMargin, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: imageView, attribute: .bottomMargin, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0)
        ]
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //Activates all condtraints within the imageViewConstraints array.
        NSLayoutConstraint.activate(imageViewConstraints)
        
    }

    func updateViews() {
        //Unwrap optional photo value, and assign it's imageData property to a UIImageView.image.
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
    }
    
}

