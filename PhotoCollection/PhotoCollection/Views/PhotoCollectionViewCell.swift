//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    weak var photoCellImageView: UIImageView!
    weak var photoNameLabel: UILabel!

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        photoCellImageView.image = UIImage(data: photo.imageData)
        photoNameLabel.text = photo.title
    }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setUpSubViews()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           setUpSubViews()
       }
    
    
    func setUpSubViews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.backgroundColor = .blue
        
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
        
        self.photoCellImageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.text = photo?.title
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        self.photoNameLabel = label
    }
    
}
