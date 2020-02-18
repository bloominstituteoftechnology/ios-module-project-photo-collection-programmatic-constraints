//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    
    var imageView = UIImageView()
    var title = UILabel()
    
    var photo: Photo?  {
        didSet{
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
           super.init(coder: coder)
           setUpSubviews()
    }
    
    func updateViews() {
        guard let photo = photo  else { return }
        imageView.image = UIImage(data: photo.imageData)
        title.text = photo.title
    }
    
    func setUpSubviews() {
        
        // ImageViww
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
       
       // Title Label
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .center
        addSubview(title)
        
        
        
        // Leading Constraints
        
        let imageViewLeadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let titleLeadingConstraint = NSLayoutConstraint(item: title, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1.0, constant: 0)
        
        // Trailing Constants
        
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0)
        
          let titleTrailingConstraint = NSLayoutConstraint(item: title, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        // Top Constraint
        
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0 )
        
        // Bottom Constraints
        
        let imageViewBottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 0)
       
        let titleBottomConstraint = NSLayoutConstraint(item: title,
        attribute: .bottom,
        relatedBy: .equal,
        toItem: safeAreaLayoutGuide,
        attribute: .bottom,
        multiplier: 1,
        constant: 5)
        
        // Height Constraints - AKA .height
        
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1.0, constant: 0)
        
        let titleHeightConstraint = NSLayoutConstraint(item: title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .leading, multiplier: 1.0, constant: 50)
        

        NSLayoutConstraint.activate([imageViewLeadingConstraint, titleLeadingConstraint, imageViewTrailingConstraint, titleTrailingConstraint, imageViewTopConstraint, imageViewTopConstraint, imageViewHeightConstraint, titleHeightConstraint, imageViewBottomConstraint, titleBottomConstraint])
        
    }
    
    
   
}
