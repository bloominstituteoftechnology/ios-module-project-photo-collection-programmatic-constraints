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
    private var imageLabel = UILabel()
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
        // created image view and label for the photo
        //add subviews
        addSubview(imageView)
        addSubview(imageLabel)
        // creating constraints
        
        let imageXView = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 6)
        let imageYView = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 6)
        let imageWidth = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -6)
        let imageHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1.0, constant: 0)
        
        // activate constraints
        NSLayoutConstraint.activate([imageXView, imageYView, imageWidth, imageHeightConstraint])
    
        
    }
    
    func updateViews() {
        imageView.image = UIImage(data: photo!.imageData)
        imageLabel.text = photo?.title
        
    }
    
    
}
