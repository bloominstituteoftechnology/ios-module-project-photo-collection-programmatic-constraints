//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private var nameLabel: UILabel!
    private var imageView: UIImageView!
    
    var photo: Photo! {
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
    
    private func setUpSubviews() {
        // image view
        //  create / configure
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        //  label will display the photo's title
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        addSubview(label)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        self.imageView = imageView

        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.nameLabel = label
        
        self.heightAnchor.constraint(equalToConstant: 200)
        self.widthAnchor.constraint(equalToConstant: 200)
    }
    
    func updateViews() {
        guard let coolPhoto = photo else { return }
        
        let data = coolPhoto.imageData
        let image = UIImage(data: data)
        imageView.image = image
        nameLabel.text = photo.title
    }
}
