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
    var imageView: UIImageView!
    var label: UILabel!
    
    func setUpViews() {
        
        imageView = UIImageView()
        label = UILabel()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        label.backgroundColor = .white
        label.textColor = .black
        
        let myConstraints = [
            NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 40.0),
            NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 40.0),
            NSLayoutConstraint(item: imageView, attribute: .topMargin, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 40.0),
            NSLayoutConstraint(item: label, attribute: .topMargin, relatedBy: .equal, toItem: imageView, attribute: .bottomMargin, multiplier: 1.0, constant: 8.0),
            NSLayoutConstraint(item: label, attribute: .bottomMargin, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 10.0),
            NSLayoutConstraint(item: label, attribute: .leftMargin, relatedBy: .equal, toItem: contentView, attribute: .leftMargin, multiplier: 1.0, constant: 8.0)
        ]
        
        NSLayoutConstraint.activate(myConstraints)
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        setUpViews()
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
        
    }
    
}
