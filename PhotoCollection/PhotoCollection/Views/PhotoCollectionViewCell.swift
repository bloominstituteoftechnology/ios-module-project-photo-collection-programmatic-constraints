//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties

    var photo: Photo?
    var nameLabel: UILabel!
    var imageView: UIImageView!
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    //MARK: Private
    
    private func setUpSubviews() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1,
                               constant: 4),
            
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
                               constant: -2)
        ])
        
        self.imageView = imageView
        
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 4),
            
            NSLayoutConstraint(item: nameLabel,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2),
            
            NSLayoutConstraint(item: nameLabel,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: 2)
        ])
        
        self.nameLabel = nameLabel
    }
    
    private func updateViews() {
        nameLabel.text = photo?.title
        if let imageData = photo?.imageData {
            imageView.image = UIImage(data: imageData)
        }
    }
    
}
