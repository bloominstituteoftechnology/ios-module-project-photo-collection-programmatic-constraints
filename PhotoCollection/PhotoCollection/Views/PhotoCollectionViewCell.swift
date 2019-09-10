//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var label: UILabel!

    var photo: Photo! {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setSubViews()
    }
    private func setSubViews() {
        
        
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
//        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
//        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: 0).isActive = true
        
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
        
        self.imageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.label = label
        
        self.heightAnchor.constraint(equalToConstant: 200)
        self.widthAnchor.constraint(equalToConstant: 200)
        
        
    }
    
    private func updateViews() {
        guard let photo = photo else {return}
        
        label.text = photo.title
        let data = photo.imageData
        let image = UIImage(data: data)
        imageView.image = image
    }
    
}
