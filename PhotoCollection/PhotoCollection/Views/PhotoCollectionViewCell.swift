//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

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
        super.init(coder: coder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        // Image
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .top,
                                                        multiplier: 1,
                                                        constant: 4)
        
        let imageVewLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: self,
                                                           attribute: .leading,
                                                           multiplier: 1,
                                                           constant: 4)
        
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                             attribute: .trailing,
                                                             relatedBy: .equal,
                                                             toItem: self,
                                                             attribute: .trailing,
                                                             multiplier: 1,
                                                             constant: -4)
        
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .width,
                                                           multiplier: 0.75,
                                                           constant: 0)
        
        self.imageView = imageView
        
        // Label
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        let labelTopConstraint = NSLayoutConstraint(item: label,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: imageView,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: 4)
        
        let labelLeadingConstraint = NSLayoutConstraint(item: label,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 4)
        
        let labelTrailingConstraint = NSLayoutConstraint(item: label,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: self,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: -4)
        
        self.label = label
    
       NSLayoutConstraint.activate([imageViewTopConstraint, imageVewLeadingConstraint, imageViewTrailingConstraint, imageViewHeightConstraint, labelTopConstraint, labelLeadingConstraint, labelTrailingConstraint])
        
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
}
