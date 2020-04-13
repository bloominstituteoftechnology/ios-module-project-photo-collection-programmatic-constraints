//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //        - Create an image view that will display the `UIImage` that the `photo.imageData` contains.
    //        - Create a label that will display the `Photo`'s `title`.
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
    
    // MARK: - Private methods
    
    //        - You will want to call this function only once. Otherwise you will end up adding image views and labels over and over again to the cell.
    private func setUpSubviews() {
        
        //        - Constrain these views to the cell programmatically using only the `NSLayoutConstraint` initializer. (Yes, the long one. No anchors yet. 😉)
        
        // MARK: - imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // This is the y constraint
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        // This is the x constraint
        let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
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
        
        
        // MARK: - Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        // This is the y constraint
        let titleLabelYConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: imageView,
                                                       attribute: .bottom,
                                                       multiplier: 1.0,
                                                       constant: 4)
        
        // This is the x constraint
        let titleLabelXConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: leadingAnchor,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: 2)
        
        // This is the width constraint
        let titleLabelWidthConstraint = NSLayoutConstraint(item: titleLabel,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: trailingAnchor,
                                                           attribute: .trailing,
                                                           multiplier: 1.0,
                                                           constant: -2)
        
        NSLayoutConstraint.activate([imageViewXConstraint, imageViewYConstraint, imageViewWidthConstraint, imageViewHeightConstraint,
                                     titleLabelYConstraint, titleLabelXConstraint, titleLabelWidthConstraint])
    }
 
    func updateViews() {
//  function that passes the information from the Photo to the image view and label. (If you need help turning `Data` into a `UIImage` look at `UIImage`'s initializers in the documentation.
//        Call this function sometime after the `photo` variable has been given a value from the `cellForItem at` method in the `PhotosCollectionViewController`. There are a couple places you could decide to do this.
        
        guard let photo = photo else { return }
        
        titleLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
}
