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
    var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubViews()
    }
    
    func setupSubViews() {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        addSubview(label)
        
        let labelLeadingConstraint = NSLayoutConstraint(item: label,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: imageView,
                                                              attribute: .leading,
                                                              multiplier: 1,
                                                              constant: 0)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: label,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: imageView,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: 0)
        
        let labelBottomConstraint = NSLayoutConstraint(item: label,
                                                             attribute: .bottom,
                                                             relatedBy: .equal,
                                                             toItem: safeAreaLayoutGuide,
                                                             attribute: .bottom,
                                                             multiplier: 1,
                                                             constant: 4)
        
        NSLayoutConstraint.activate([
            labelLeadingConstraint,
            labelTrailingConstraint,
            labelBottomConstraint
        ])
        
        //imageView constraints
        let imageViewLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                                  attribute: .leading,
                                                                  relatedBy: .equal,
                                                                  toItem: safeAreaLayoutGuide,
                                                                  attribute: .leading,
                                                                  multiplier: 1,
                                                                  constant: 4)
        
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                                   attribute: .trailing,
                                                                   relatedBy: .equal,
                                                                   toItem: safeAreaLayoutGuide,
                                                                   attribute: .trailing,
                                                                   multiplier: 1,
                                                                   constant: 4)
        
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                                                              attribute: .top,
                                                              relatedBy: .equal,
                                                              toItem: safeAreaLayoutGuide,
                                                              attribute: .top,
                                                              multiplier: 1,
                                                              constant: 4)
        
        let imageViewBottomConstraint = NSLayoutConstraint(item: imageView,
                                                                 attribute: .bottom,
                                                                 relatedBy: .equal,
                                                                 toItem: label,
                                                                 attribute: .top,
                                                                 multiplier: 1,
                                                                 constant: 0)
        
        //label constraints
        let labelLeadingConstraint = NSLayoutConstraint(item: label,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: imageView,
                                                              attribute: .leading,
                                                              multiplier: 1,
                                                              constant: 0)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: label,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: imageView,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: 0)
        
        let labelBottomConstraint = NSLayoutConstraint(item: label,
                                                             attribute: .bottom,
                                                             relatedBy: .equal,
                                                             toItem: safeAreaLayoutGuide,
                                                             attribute: .bottom,
                                                             multiplier: 1,
                                                             constant: 4)
        
        NSLayoutConstraint.activate([
            imageViewLeadingConstraint,
            imageViewTrailingConstraint,
            imageViewTopConstraint,
            imageViewBottomConstraint,
            labelLeadingConstraint,
            labelTrailingConstraint,
            labelBottomConstraint
        ])
        
        self.imageView = imageView
        self.titleLabel = label
    }
    
    func updateViews() {
        imageView.image = UIImage(data: photo?.imageData ?? Data())
        titleLabel.text = photo?.title
    }
    
}
