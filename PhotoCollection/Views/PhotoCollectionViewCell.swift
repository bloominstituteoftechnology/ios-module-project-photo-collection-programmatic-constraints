//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    
    private func setUpSubViews() {
        
        // MARK: - Views
        let imageView = UIImageView()
        let titleLabel = UILabel()
        
        // Resizing and repositioning elements
        imageView.contentMode = .scaleAspectFit
        titleLabel.textAlignment = .center
        
        // Adding subviews
        addSubview(imageView)
        addSubview(titleLabel)
        
        // Turning off automatic constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Constraints
        
        // Image
        NSLayoutConstraint.activate([
                   NSLayoutConstraint(item: imageView,
                                      attribute: .top,
                                      relatedBy: .equal,
                                      toItem: imageView,
                                      attribute: .bottom,
                                      multiplier: 1,
                                      constant: 4),
                   
                   NSLayoutConstraint(item: imageView,
                                      attribute: .leading,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: .leading,
                                      multiplier: 1,
                                      constant: 8),
                   
                   NSLayoutConstraint(item: imageView,
                                      attribute: .trailing,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: .trailing,
                                      multiplier: 1,
                                      constant: -8)
               ])
        
        // Label
        NSLayoutConstraint.activate([
                   NSLayoutConstraint(item: titleLabel,
                                      attribute: .top,
                                      relatedBy: .equal,
                                      toItem: imageView,
                                      attribute: .bottom,
                                      multiplier: 1,
                                      constant: 4),
                   
                   NSLayoutConstraint(item: titleLabel,
                                      attribute: .leading,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: .leading,
                                      multiplier: 1,
                                      constant: 2),
                   
                   NSLayoutConstraint(item: titleLabel,
                                      attribute: .trailing,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: .trailing,
                                      multiplier: 1,
                                      constant: -2)
               ])
        
        
        // Adding local views to actual view
        self.imageView = imageView
        self.titleLabel = titleLabel
    }
    
    func updateViews() {
        
        guard let title = photo?.title,
            let photoImageData = photo?.imageData else { return }
        
        titleLabel.text = title
        imageView.image = UIImage(data: photoImageData)
        
    }
    
}
