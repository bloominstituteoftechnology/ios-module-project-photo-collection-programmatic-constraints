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
    
    var imageView = UIImageView()
    var label = UILabel()
    
    func updateViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(label)
        
        let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        let imageViewLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        let imageViewTrailingConstraint = imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        let imageViewHeight = imageView.heightAnchor.constraint(equalToConstant: 50)
        
        
        let labelTopConstraint = label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        let labelTrailingConstraint = label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        let labelHeight = label.heightAnchor.constraint(equalToConstant: 20)
        
        guard let photo = photo else {return}
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
        
        NSLayoutConstraint.activate([imageViewHeight, imageViewTopConstraint, imageViewLeadingConstraint, imageViewTrailingConstraint, labelTopConstraint, labelLeadingConstraint, labelTrailingConstraint, labelHeight])
    }
    
    
}
