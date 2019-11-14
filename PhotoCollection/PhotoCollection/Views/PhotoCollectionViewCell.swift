//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var imageView: UIImageView!
    var label: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubviews()
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
    
    func setUpSubviews() {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        
        addSubview(imageView)
        self.imageView = imageView
        
        
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -2).isActive = true
        
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 2/3,
                           constant: 0).isActive = true
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        addSubview(label)
        self.label = label
        
        
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -2).isActive = true
        
    }
    
}
