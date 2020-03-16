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
    
    private func setUpSubviews() {
        let uiImage = UIImageView()
        uiImage.image = UIImage(data: photo!.imageData)
        uiImage.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = photo?.title
        titleLabel.textAlignment = .center
        
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - UIImage Constraints
        
        //Size
        let imageHeightConstraint = NSLayoutConstraint(item: uiImage,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1,
                                                       constant: 200)
        
        let imageWidthConstraint = NSLayoutConstraint(item: uiImage,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: uiImage,
                                                      attribute: .height,
                                                      multiplier: 1,
                                                      constant: 0)
        
        // Position
        let imageYConstraint = NSLayoutConstraint(item: uiImage,
                                                  attribute: .centerY,
                                                  relatedBy: .equal,
                                                  toItem: self.safeAreaLayoutGuide,
                                                  attribute: .centerY,
                                                  multiplier: 1,
                                                  constant: 0)
        
        let imageXConstraint = NSLayoutConstraint(item: uiImage,
                                                  attribute: .centerX,
                                                  relatedBy: .equal,
                                                  toItem: self.safeAreaLayoutGuide,
                                                  attribute: .centerX,
                                                  multiplier: 1,
                                                  constant: 0)
        
        // MARK: - Label
        
        // Size
        let labelLeadingConstraint = NSLayoutConstraint(item: titleLabel,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: uiImage,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 0)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: titleLabel,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: uiImage,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: 0)
        
        // Position
        
        let labelTopConstraint = NSLayoutConstraint(item: titleLabel,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: uiImage,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: 20)
        
        NSLayoutConstraint.activate([imageHeightConstraint, imageWidthConstraint, imageYConstraint, imageXConstraint, labelLeadingConstraint, labelTrailingConstraint, labelTopConstraint])
    }
}
