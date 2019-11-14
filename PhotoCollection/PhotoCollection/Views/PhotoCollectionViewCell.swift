//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    weak var photoCellImageView: UIImageView!
    weak var photoNameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        photoCellImageView.image = UIImage(data: photo.imageData)
        photoNameLabel.text = photo.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
    
    func setUpSubViews() {
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
            
            self.photoCellImageView = imageView
            
            
            
            
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
            
            
            
            
        }
        
    }
}
