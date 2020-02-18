//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
     var photoCellImageView: UIImageView!
     var photoNameLabel: UILabel!
    
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
            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
            photoCellImageView = imageView
            
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

            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
            photoNameLabel = label
//            label.lineBreakMode = .byWordWrapping
//            label.numberOfLines = 0
            
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
                                                            constant: 0).isActive = true
            
                                          NSLayoutConstraint(item: label,
                                                             attribute: .trailing,
                                                             relatedBy: .equal,
                                                             toItem: self,
                                                             attribute: .trailing,
                                                             multiplier: 1,
                                                             constant: 0).isActive = true
//            NSLayoutConstraint.activate([imageTopAnchorContraint,imageLeadingConstraint,imageHeightAnchor,labelTopAnchorContraint,labelLeadingConstraint,labelTrailingConstraint,imageTrailingConstraint])
      
        
    }
    
   
}
