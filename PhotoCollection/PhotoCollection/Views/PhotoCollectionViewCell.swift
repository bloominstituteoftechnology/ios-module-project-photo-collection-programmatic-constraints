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
    private var nameLabel = UILabel()
    
    var photo: Photo?  {
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
    
    private func setUpSubviews() {
        // configure imageview and use NSLayoutConstraints or NSLayoutAnchor to add constraints to the image view.
        
        // 1. create/configure subview.
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        //2. add subview to view hierarchy
        
        addSubview(imageView)
        
        //3. create constraints
        
        // This is the y constraint
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 4)  // pushes imageView down from top of cell 4 points.
        
        
        // This is the x constraint
        
        let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)  // four points right from left edge of cell.
        
        // This is the width constraint
        let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -4)
        
        // This is the height constraint
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0)
        
        
        
        let nameLabelYConstraint = NSLayoutConstraint(item: nameLabel,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: imageView,
                                                      attribute: .bottom,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        let nameLabelXConstraint = NSLayoutConstraint(item: nameLabel,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        let nameLabelWidthConstraint = NSLayoutConstraint(item: nameLabel,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -4)
        
        //4. activate constraints
        NSLayoutConstraint.activate([imageViewXConstraint, imageViewYConstraint, imageViewWidthConstraint, imageViewHeightConstraint, nameLabelYConstraint, nameLabelXConstraint, nameLabelWidthConstraint])
        
    }
    
  private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
    
}
