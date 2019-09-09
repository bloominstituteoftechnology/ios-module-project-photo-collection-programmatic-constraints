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
    var imageView = UIImageView()
    var imageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpSubViews()
    }
    
    func setUpSubViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        let imageViewLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 1)
        
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .top,
                                                        multiplier: 1,
                                                        constant: 1)
        
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .trailing,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .trailing,
                                                        multiplier: 1,
                                                        constant: -1)
        
        let imageViewAspectRatioConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: imageView,
                                                        attribute: .width,
                                                        multiplier: 1,
                                                        constant: 0)
        
        NSLayoutConstraint.activate([imageViewLeadingConstraint, imageViewTopConstraint, imageViewTrailingConstraint, imageViewAspectRatioConstraint])
        
        
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.textAlignment = .center
        addSubview(imageLabel)
        
        let labelTopConstraint = NSLayoutConstraint(item: imageLabel,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: imageView,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: 2)
        
        let labelLeadingConstraint = NSLayoutConstraint(item: imageLabel,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 1)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: imageLabel,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: self,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: -1)
        
        let labelBottomConstraint = NSLayoutConstraint(item: imageLabel,
                                                       attribute: .bottom,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .bottom,
                                                       multiplier: 1,
                                                       constant: -2)
        
        NSLayoutConstraint.activate([labelTopConstraint, labelLeadingConstraint, labelTrailingConstraint, labelBottomConstraint])
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        imageLabel.text = photo.title
    }
    
}
