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
    
    private var imageView: UIImageView!
    private var label: UILabel!

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    
    
    
    
    func updateViews(){
        
        guard let photo = photo else {return}
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
        
    }
    
    
    func setUpSubviews(){
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let imageTopAnchorContraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 4)
        
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
        
        let imageHeightAnchor = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        
        self.imageView = imageView
        
                
        
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        
        let labelTopAnchorContraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 4)
        
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
        NSLayoutConstraint.activate([imageTopAnchorContraint,imageLeadingConstraint,imageHeightAnchor,labelTopAnchorContraint,labelLeadingConstraint,labelTrailingConstraint,imageTrailingConstraint])
//        let labelHeightAnchor = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
//
       
        
        
        
    }
    
}
