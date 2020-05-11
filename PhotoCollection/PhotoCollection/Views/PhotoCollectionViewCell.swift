//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "PhotoCell"
    
    private var imageView = UIImageView()
    private var nameLabel = UILabel()
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    // This init method is required, but since we're not going to use it
    // (mostly used by storyboard), we'll warn others not to use it by adding
    // the fatalError call (which intentionally crashes the app).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
    
    private func setUpSubviews() {
        // Image View
        // 1. Create/configure
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        // 2. Add to view hierarchy
        addSubview(imageView)
        
        // 3. Create/activate constraints
        
        //This it the Y
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        //this is the X
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        //This is the width
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        //This is the height (aspect ratio) kinda
        NSLayoutConstraint(item: imageView,
                           attribute: .height ,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Label
        // 1. Create/configure
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        
        // 2. Add to view hierarchy
        addSubview(nameLabel)
        
        // 3. Create/activate constraints
        
        // This is the Y
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        
        //This is the X
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2).isActive = true
        
        //This the width
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2).isActive = true
        
    }
    
}
