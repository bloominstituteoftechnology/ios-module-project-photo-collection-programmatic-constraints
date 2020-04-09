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
            if let image = photo?.imageData,
                let newPhoto = UIImage(data: image) {
                imageView.image = newPhoto
            }
            photoTitleLabel.text = photo?.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private var imageView: UIImageView!
    private var photoTitleLabel: UILabel!

    
    func setUpSubviews() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        self.imageView = imageView
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
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
        
        
        let photoTitleLabel = UILabel()
        photoTitleLabel.textAlignment = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(photoTitleLabel)
        self.photoTitleLabel = photoTitleLabel
        NSLayoutConstraint(item: photoTitleLabel,
                                  attribute: .top,
                                  relatedBy: .equal,
                                  toItem: imageView,
                                  attribute: .bottom,
                                  multiplier: 1,
                                  constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: photoTitleLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -2).isActive = true
        
    }
}
