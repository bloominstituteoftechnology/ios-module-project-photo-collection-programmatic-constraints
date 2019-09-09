//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    private var imageView: UIImageView!
    private var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubViews()
    }
    
    //override func
    
    
    func setupSubViews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        //imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -2).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: -2).isActive = true
        //imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 2).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 2).isActive = true
        //imageView.trailingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.trailingAnchor, multiplier: -4)
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -2).isActive = true
        //imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        self.imageView = imageView
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        //label.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 4).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 4).isActive = true
        //label.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 2).isActive = true
        //label.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -2).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -2).isActive = true
        self.label = label
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        label.text = photo.title
    }
    
}
