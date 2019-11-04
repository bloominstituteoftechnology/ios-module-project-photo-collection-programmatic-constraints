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
    
    func setUpSubViews() {
        guard let photo = photo,
            let image = UIImage(data: photo.imageData)
            else { return }
        let imageView = UIImageView(image: image)
        
        let titleLabel = UILabel()
        titleLabel.text = photo.title
        
        let imageTopConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1,
            constant: 0
        )
        
        let imageLeadingConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1,
            constant: 0
        )
        
        let imageTrailingConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1,
            constant: 0
        )
        
        let imageHeightConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: imageView,
            attribute: .width,
            multiplier: 1,
            constant: 0
        )
        
        NSLayoutConstraint.activate([imageTopConstraint, imageLeadingConstraint, imageTrailingConstraint, imageHeightConstraint])
    }
}
