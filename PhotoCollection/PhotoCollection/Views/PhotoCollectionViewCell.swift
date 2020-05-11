//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var photo: Photo?
    //MARK: - Programmatic Outlets
    private var imageView = UIImageView()
    private var photoTitle = UILabel()
    
    //MARK: - INITIALIZER
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    //MARK: - UPDATE VIEWS FUNCTION
    func updateViews() {
        guard let photo = photo else { return }
        photoTitle.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    //MARK: - SUBVIEWS FUNCTION
    func setUpSubviews() {
        //1. Create
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        //Create/activate constraints
        //MARK: - Y CONSTRAINTS
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        //MARK: - X CONSTRAINTS
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        //MARK: - WIDTH CONSTRAINTS
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        //MARK: HEIGHT CONSTRAINTS
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        //MARK: - LABEL CONSTRAINTS
        
        photoTitle.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.textAlignment = .center
        
        addSubview(photoTitle)
        //MARK: - Y CONSTRAINTS
        NSLayoutConstraint(item: photoTitle,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        //MARK: - X CONSTRAINTS
        NSLayoutConstraint(item: photoTitle,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        //MARK: - WIDTH CONSTRAINTS
        NSLayoutConstraint(item: photoTitle,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing ,
                           multiplier: 1,
                           constant: -4).isActive = true
      
     
         
        
        
    }
}
