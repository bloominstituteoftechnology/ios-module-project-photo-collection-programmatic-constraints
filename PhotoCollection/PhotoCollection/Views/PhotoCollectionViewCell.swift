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
    private var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet{
            updateViews()
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
    
    func setUpSubviews() {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        self.imageView = imageView
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        //label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
        self.titleLabel = label
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        titleLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
}
