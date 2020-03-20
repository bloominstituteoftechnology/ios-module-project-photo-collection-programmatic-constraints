//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    private let imageView = UIImageView()
    private let titleLabel = UILabel()

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }

    // This init runs when defining the cell in the storboard, but the subviews are laid out programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubviews()
    }

    
    private func updateViews() {
        // Unwrap photo object and
        // Convert data blob into a UIImage
        guard let photo = photo,
            let pic = UIImage(data: photo.imageData) else { return }

        // Put the pic and title into the cell
        imageView.image = pic
        titleLabel.text = photo.title
    }

    private func setUpSubviews() {
        // Image View
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // FIXME: Remove
        imageView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
        addSubview(imageView)
        
        // Constrain image top
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        
        // Constrain image leading
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true

        // Constrain image trailing
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        // Image height is the same as the width
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        addSubview(titleLabel)

        let labelTopConstraint = NSLayoutConstraint(item: titleLabel,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: imageView,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: 4)

        let labelLeadingConstraint = NSLayoutConstraint(item: titleLabel,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self.safeAreaLayoutGuide,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 2)

        let labelTrailingConstraint = NSLayoutConstraint(item: titleLabel,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: self.safeAreaLayoutGuide,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: -2)

        // FIXME: Why is this needed?
        // Why does both toItem imageView and titleLabel crash?
//        let labelHeightConstraint = NSLayoutConstraint(item: titleLabel,
//                                                       attribute: .height,
//                                                       relatedBy: .equal,
//                                                       toItem: imageView,
//                                                       attribute: .bottom,
//                                                       multiplier: 1,
//                                                       constant: 14)

        NSLayoutConstraint.activate([labelTopConstraint,
                                     labelLeadingConstraint,
                                     labelTrailingConstraint,
                                     ])//labelHeightConstraint])
    }
}
