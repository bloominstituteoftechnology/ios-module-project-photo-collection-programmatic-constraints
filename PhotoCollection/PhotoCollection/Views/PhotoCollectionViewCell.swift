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
    private var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let imageViewLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                            attribute: .leading,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .leading,
                                                            multiplier: 1,
                                                            constant: 10)
        
        let imageViewTrailingConstraint = NSLayoutConstraint(item: imageView,
                                                             attribute: .trailing,
                                                             relatedBy: .equal,
                                                             toItem: self,
                                                             attribute: .trailing,
                                                             multiplier: 1,
                                                             constant: 10)
        
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .top,
                                                        multiplier: 1,
                                                        constant: 10)
        
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .width,
                                                           multiplier: 1,
                                                           constant: 0)
        
        NSLayoutConstraint.activate([imageViewLeadingConstraint,
                                     imageViewTrailingConstraint,
                                     imageViewTopConstraint,
                                     imageViewHeightConstraint])

        self.imageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        
        NSLayoutConstraint.activate([labelTopConstraint,
                                     labelLeadingConstraint,
                                     labelTrailingConstraint])
        self.titleLabel = label
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
}
