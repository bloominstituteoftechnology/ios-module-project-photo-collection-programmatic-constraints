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
    
    private var imageView: UIImageView!
    private var photoTitleLabel: UILabel!

    
    func setUpSubviews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let photoTitleLabel = UILabel()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 150)
        
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: imageView.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20)
        
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: imageView.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20)
        
        NSLayoutConstraint(item: photoTitleLabel,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: photoTitleLabel.safeAreaLayoutGuide,
                                  attribute: .bottom,
                                  multiplier: 1,
                                  constant: 150)
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: photoTitleLabel.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 20)
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: photoTitleLabel.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -20)
        
    }
    
    private func updateViews() {
        imageView.image = UIImage(contentsOfFile: "\(photo?.imageData)")
        photoTitleLabel.text = photo?.title
    }
    
}
