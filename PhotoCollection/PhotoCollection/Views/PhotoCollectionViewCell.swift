//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private var imageView = UIImageView()
    private var titleLabel = UILabel()
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -4)
        
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0)
        
        NSLayoutConstraint.activate([imageViewYConstraint, imageViewXConstraint, imageViewWidthConstraint, imageViewHeightConstraint])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        addSubview(titleLabel)
        
        let titleLabelYConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: 4)
        
        let titleLabelXConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: 4)
        
        let titleLabelWidthConstraint = NSLayoutConstraint(item: titleLabel,
                                                            attribute: .trailing,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .trailing,
                                                            multiplier: 1.0,
                                                            constant: -4)
        
        NSLayoutConstraint.activate([titleLabelYConstraint, titleLabelXConstraint, titleLabelWidthConstraint])
    }
    
    private func updateViews() {
           guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
       }
}
