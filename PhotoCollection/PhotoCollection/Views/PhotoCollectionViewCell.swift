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
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // Used to create cells programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    // Used by storyboard to initialize cells
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        // ImageView
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let imageTopConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .top,
                                                    multiplier: 1,
                                                    constant: 4)
        
        let imageLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 4)
        
        let imageTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: self,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: -4)
        
        let imageHeightConstraint = NSLayoutConstraint(item: imageView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: imageView,
                                                       attribute: .width,
                                                       multiplier: 1,
                                                       constant: 0)
        
        NSLayoutConstraint.activate([imageTopConstraint,
                                     imageLeadingConstraint,
                                     imageTrailingConstraint,
                                     imageHeightConstraint])
        
        self.imageView = imageView
        
        // PhotoLabel
        let photoLabel = UILabel()
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.textAlignment = .center
        addSubview(photoLabel)
        
        let photoLabelTopConstraint = NSLayoutConstraint(item: photoLabel,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: imageView,
                                                         attribute: .bottom,
                                                         multiplier: 1,
                                                         constant: 4)
        
        let photoLabelLeadingConstraint = NSLayoutConstraint(item: photoLabel,
                                                             attribute: .leading,
                                                             relatedBy: .equal,
                                                             toItem: self,
                                                             attribute: .leading,
                                                             multiplier: 1,
                                                             constant: 2)
        
        let photoLabelTrailingConstraint = NSLayoutConstraint(item: photoLabel,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: self,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: -2)
        
        NSLayoutConstraint.activate([photoLabelTopConstraint,
                                     photoLabelLeadingConstraint,
                                     photoLabelTrailingConstraint])
        
        self.photoLabel = photoLabel
        
    }
    
    private func updateViews() {
        guard let photo = self.photo else { return }
        photoLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
}
