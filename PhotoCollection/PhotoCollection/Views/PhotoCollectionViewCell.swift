//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
        required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    func setUpViews() {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        let leadingConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 4)
        
        let trailingConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1,
                                                    constant: -4)
        let aspectRatio = NSLayoutConstraint(item: imageView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: imageView,
                                             attribute: .width,
                                             multiplier: 1,
                                             constant: 0)
       
        let photoLabel = UILabel()
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.textAlignment = .center
        photoLabel.contentCompressionResistancePriority(for:  .vertical)
        addSubview(photoLabel)
        
        let topConstraint = NSLayoutConstraint(item: photoLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: imageView,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 4)
        
        let labelLead = NSLayoutConstraint(item: photoLabel,
                                           attribute: .leading,
                                           relatedBy: .equal,
                                           toItem: self,
                                           attribute: .leading,
                                           multiplier: 1,
                                           constant: 2)
        
        let labelTrail = NSLayoutConstraint(item: photoLabel,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: -2)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, aspectRatio, topConstraint, labelLead, labelTrail])
        self.imageView = imageView
        self.nameLabel = photoLabel
    }
    
    private func updateViews() {
        self.nameLabel.text = photo?.title
        if let validData = photo?.imageData {
            self.imageView.image = UIImage(data: validData)
        }
    }
}
