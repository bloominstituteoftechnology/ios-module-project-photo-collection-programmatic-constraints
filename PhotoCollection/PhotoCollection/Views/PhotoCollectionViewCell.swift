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
    private var photoLabel: UILabel!

    var photo: Photo! {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubViews()
    }
    
    
    
    func setupSubViews() {
        
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        addSubview(photoImageView)
        
        NSLayoutConstraint(item: photoImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 4).isActive = true
        
        NSLayoutConstraint(item: photoImageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        self.imageView = photoImageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.photoLabel = label
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
        
    }
    
}
