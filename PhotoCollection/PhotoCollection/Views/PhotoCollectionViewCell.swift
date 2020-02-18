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
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.5)
        ])
        
        self.imageView = imageView
        
        let label = UILabel()
        label.textAlignment = .center
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: label,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 4),
            
            NSLayoutConstraint(item: label,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2),
            
            NSLayoutConstraint(item: label,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -2),
            
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.titleLabel = label
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        titleLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
}
