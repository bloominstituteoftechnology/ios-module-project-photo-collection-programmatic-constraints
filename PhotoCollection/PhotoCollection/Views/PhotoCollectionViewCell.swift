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
    
    func setUpSubviews() {
        guard let photo = photo else { return }
        let newImageView = UIImageView()
        newImageView.backgroundColor = .purple
        
        let photoTitleLabel = UILabel()
        photoTitleLabel.text = photo.title
        
        let photoContstraints = [
        NSLayoutConstraint(item: newImageView, attribute: .leading, relatedBy: .equal, toItem: UITableViewCell.self, attribute: .leading, multiplier: 1.0, constant: 25.0),
        NSLayoutConstraint(item: newImageView, attribute: .trailing, relatedBy: .equal, toItem: UITableViewCell.self, attribute: .trailing, multiplier: 1.0, constant: 25.0),
        NSLayoutConstraint(item: newImageView, attribute: .topMargin, relatedBy: .equal, toItem: UITableViewCell.self, attribute: .topMargin, multiplier: 1.0, constant: 25.0),
        NSLayoutConstraint(item: newImageView, attribute: .bottomMargin, relatedBy: .equal, toItem: UITableViewCell.self, attribute: .bottomMargin, multiplier: 1.0, constant: 25.0)
            ]
        
        NSLayoutConstraint.activate(photoContstraints)
    }
    
    func updateViews() {
        
        
    }
    
    
}
