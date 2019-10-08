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
            updateViews()
        }
    }
        
    var imageView: UIImageView!
    var nameLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    
    func setUpSubviews() {
        // image view constraints
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .top,
                                                        multiplier: 1,
                                                        constant: 4)
        
        let imageViewLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                            attribute: .leading,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .leading,
                                                            multiplier: 1,
                                                            constant: 2)
        
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                             attribute: .trailing,
                                                             relatedBy: .equal,
                                                             toItem: self,
                                                             attribute: .trailing,
                                                             multiplier: 1,
                                                             constant: -2)
        
        let imageViewBottomConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: nameLabel,
                                                           attribute: .top,
                                                           multiplier: 1,
                                                           constant: 4)
        
        let imageViewHeightConstraint = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
        
        self.imageView = imageView
        
        NSLayoutConstraint.activate([imageViewTopConstraint, imageViewBottomConstraint, imageViewLeadingConstraint, imageViewTrailingConstraint, imageViewHeightConstraint])
        
        let label = UILabel()
        label.textAlignment = .center
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabelTopConstraint = NSLayoutConstraint(item: label,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: imageView,
                                                        attribute: .bottom,
                                                        multiplier: 1,
                                                        constant: 4)
        
        let nameLabelLeadingConstraint = NSLayoutConstraint(item: label,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: self,
                                                           attribute: .leading,
                                                           multiplier: 1,
                                                           constant: 2)
        
        let nameLabelTrailingConstraints = NSLayoutConstraint(item: label,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: self,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: -2)
        self.nameLabel = label
        
        NSLayoutConstraint.activate([nameLabelTopConstraint, nameLabelLeadingConstraint, nameLabelTrailingConstraints])
    }

     func updateViews() {
        // function that passes the information from the Photo to the image view and label
        guard let photoImageData = photo?.imageData else { return }
        imageView.image = UIImage(data: photoImageData)
        nameLabel.text = photo?.title
    }
}
