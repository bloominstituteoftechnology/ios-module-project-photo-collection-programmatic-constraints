//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    // other classes don't have to modify it
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()

    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpSubViews()
    }
    
    private func updateViews() {
        setUpSubViews()
        guard let photo = photo else { return }
        
        self.label.text = photo.title
        
        imageView.image = UIImage(data: photo.imageData)
    }
    
    private func setUpSubViews() {
        // vertical stackview
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10.0
        self.contentView.addSubview(self.stackView) // content view is needed to avoid overlap from other Apple standard elements
        let stackViewConstraints = [
            NSLayoutConstraint(item: stackView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.contentView,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: stackView,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self.contentView,
                               attribute: .leading,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: stackView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self.contentView,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: stackView,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self.contentView,
                               attribute: .trailing,
                               multiplier: 1.0,
                               constant: 0.0),
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
        
        let width = UIScreen.main.bounds.width
        let spacing = CGFloat(20.0)
        let itemWidth = (width - 3.0 * spacing) / 2.0
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(imageView)
        let imageViewConstraints = [
            NSLayoutConstraint(item: imageView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: itemWidth),
            NSLayoutConstraint(item: imageView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: 80.0)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)

        self.stackView.addArrangedSubview(label)
        self.label.textAlignment = .center
    }
}
