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
    var imageView = UIImageView()
    var photoTitle = UILabel()
    
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        photoTitle.text = photo.title
    }
    
    
    func setUpSubviews() {
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -4)
        
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0)
        
        NSLayoutConstraint.activate([imageViewXConstraint, imageViewYConstraint, imageViewWidthConstraint, imageViewHeightConstraint])
        
        photoTitle.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.textAlignment = .center
        
        addSubview(photoTitle)
        
        let photoTitleYConstraint = NSLayoutConstraint(item: photoTitle,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: imageView,
                                                       attribute: .bottom,
                                                       multiplier: 1.0,
                                                       constant: 4)
        
        let photoTitleXConstraint = NSLayoutConstraint(item: photoTitle,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: 2)
        
        let photoTitleWidthConstraint = NSLayoutConstraint(item: photoTitle,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: self,
                                                           attribute: .trailing,
                                                           multiplier: 1.0,
                                                           constant: -2)
        
        let photoTitleHeightConstraint = NSLayoutConstraint(item: photoTitle,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: photoTitle,
                                                            attribute: .width,
                                                            multiplier: 1.0,
                                                            constant: 0)
        
        NSLayoutConstraint.activate([photoTitleXConstraint, photoTitleYConstraint, photoTitleWidthConstraint, photoTitleHeightConstraint])
    }
    
}
