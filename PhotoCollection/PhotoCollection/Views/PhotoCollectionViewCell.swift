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
    let imageView = UIImageView()
    let label = UILabel()
    
    func setUpViews() {
        
        let myConstraints = [
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: PhotoCollectionViewCell.self, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: PhotoCollectionViewCell.self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0),
            NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0),
            NSLayoutConstraint(item: label, attribute: .topMargin, relatedBy: .equal, toItem: imageView, attribute: .bottomMargin, multiplier: 1.0, constant: 8.0),
            NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: imageView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        ]
        
        NSLayoutConstraint.activate(myConstraints)
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
    
}
