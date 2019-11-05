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
    private var titleLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    //used to create cells programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    // used by storyboard to initalize cells
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
    
    func setUpSubViews() {
        // setup of Views
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
          imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: imageView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: safeAreaLayoutGuide,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 4)
        let leadingConstraint = NSLayoutConstraint(item: imageView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: safeAreaLayoutGuide,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 8)
        let trailingConstraint = NSLayoutConstraint(item: imageView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: safeAreaLayoutGuide,
                                                    attribute: .trailing,
                                                    multiplier: 1,
                                                    constant: -8)
        let heightConstraint = NSLayoutConstraint(item: imageView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: self,
                                                  attribute: .width,
                                                  multiplier: 1,
                                                  constant: 0)
        
        NSLayoutConstraint.activate([heightConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     topConstraint])
        self.imageView = imageView
        
        
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleTopConstraint = NSLayoutConstraint(item: titleLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: imageView,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 4)
        let titleLeadingConstraint = NSLayoutConstraint(item: titleLabel,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: imageView,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 0)
        let titleTrailingConstraint = NSLayoutConstraint(item: titleLabel,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: imageView,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: 0)
        NSLayoutConstraint.activate([titleTopConstraint,
                                     titleLeadingConstraint,
                                     titleTrailingConstraint])
        self.titleLabel = titleLabel
        
        
        
    }
    private func updateViews() {
        guard let photo = photo else {return}
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
        
    }
}
