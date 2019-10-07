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
    private var nameLabel: UILabel!
    
    private func setUpSubviews() {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        let imageLabel = UILabel()
        imageLabel.textAlignment = .center
        
        addSubview(imageLabel)
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Activating all imageView's contraints
        NSLayoutConstraint.activate([
            
            NSLayoutConstraint(item: imageView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2),
            
            NSLayoutConstraint(item: imageView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -2),
            
            NSLayoutConstraint(item: imageView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1,
                               constant: 4),
            
            NSLayoutConstraint(item: imageView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .height,
                               multiplier: 1,
                               constant: 1)
            
        ])
        self.imageView = imageView
        
        // Activating all imageLabel's contraints
        NSLayoutConstraint.activate([
            
            NSLayoutConstraint(item: imageLabel,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2),
            
            NSLayoutConstraint(item: imageLabel,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -2),
            
            NSLayoutConstraint(item: imageLabel,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 4),
            
            NSLayoutConstraint(item: imageLabel,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .width,
                               multiplier: 1,
                               constant: 1)
            
        ])
        self.nameLabel = imageLabel
    }
    
    private func updateViews(image: Data, title: String) {
        guard let photoImage = photo?.imageData,
            let title = photo?.title else { return }
        
        nameLabel.text = title
        imageView.image = UIImage(data: photoImage)
    }
    
}
