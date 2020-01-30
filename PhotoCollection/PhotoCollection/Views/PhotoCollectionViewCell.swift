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
    var nameLabel: UILabel!
    

    var photo: Photo? {
        didSet {
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
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
        
    }
    
    func setUpSubviews() {
        // add imageView
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        self.imageView = imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // constraints for imageView
        
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        // add labe below centered
        let label = UILabel()
        label.textAlignment = .center
        addSubview(label)
        self.nameLabel = label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //constraints for label
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -2).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
     
    }
    
}
