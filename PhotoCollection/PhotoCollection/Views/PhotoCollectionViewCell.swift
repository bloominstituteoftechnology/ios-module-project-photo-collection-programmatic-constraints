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
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
    
    func setUpSubViews() {
        
        // imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // imageView Constraints
        NSLayoutConstraint(item: imageView,
                            attribute: .top,
                            relatedBy: .equal,
                            toItem: self, attribute: .top,
                            multiplier: 1,
                            constant: 4).isActive = true
        NSLayoutConstraint(item: imageView,
                            attribute: .leading,
                            relatedBy: .equal, toItem: self,
                            attribute: .leading,
                            multiplier: 1.0,
                            constant: 4).isActive = true
        NSLayoutConstraint(item: imageView,
                            attribute: .trailing,
                            relatedBy: .equal,
                            toItem: self,
                            attribute: .trailing,
                            multiplier: 1,
                            constant: -4).isActive = true
        NSLayoutConstraint(item: imageView,
                            attribute: .height,
                            relatedBy: .equal,
                            toItem: imageView,
                            attribute: .width,
                            multiplier: 1,
                            constant: 0).isActive = true
        
        // titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        // titleLabel constrains
        
        NSLayoutConstraint(item: titleLabel,
                                attribute: .top,
                                relatedBy: .equal,
                                toItem: imageView,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 4).isActive = true
        NSLayoutConstraint(item: titleLabel,
                                  attribute: .leading,
                                  relatedBy: .equal,
                                  toItem: self,
                                  attribute: .leading,
                                  multiplier: 1.0,
                                  constant: 4).isActive = true
        NSLayoutConstraint(item: titleLabel,
                                  attribute: .trailing,
                                  relatedBy: .equal,
                                  toItem: self,
                                  attribute: .trailing,
                                  multiplier: 1,
                                  constant: -4).isActive = true

    }
    
}
