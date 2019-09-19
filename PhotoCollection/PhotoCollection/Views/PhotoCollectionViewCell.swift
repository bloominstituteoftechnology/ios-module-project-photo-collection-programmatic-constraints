//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    let imgView = UIImageView()
    let lblTitle = UILabel()
    
    var photo: Photo? { didSet { updateViews() } }
    
    override func awakeFromNib() {
        setUpSubViews()
    }
    
    func setUpSubViews() {
        
        let constraints = [NSLayoutConstraint(item: imgView,
                                              attribute: .centerX, relatedBy: .equal,
                                              toItem: self, attribute: .centerX,
                                              multiplier: 1.0, constant: 0),
                           NSLayoutConstraint(item: imgView,
                                              attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute,
                                              multiplier: 1.0, constant: 100),
                           NSLayoutConstraint(item: imgView,
                                              attribute: .width, relatedBy: .equal,
                                              toItem: imgView, attribute: .height,
                                              multiplier: 1.0, constant: 0),
                           NSLayoutConstraint(item: lblTitle,
                                              attribute: .centerX, relatedBy: .equal,
                                              toItem: self, attribute: .centerX,
                                              multiplier: 1.0, constant: 0),
                           NSLayoutConstraint(item: lblTitle,
                                              attribute: .top, relatedBy: .greaterThanOrEqual,
                                              toItem: imgView, attribute: .bottom,
                                              multiplier: 1.0, constant: 4)
                           ]
        NSLayoutConstraint.activate(constraints)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imgView.image = UIImage(data: photo.imageData)
        lblTitle.text = photo.title
    }
}
