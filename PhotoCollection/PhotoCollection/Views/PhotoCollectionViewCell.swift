//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var photo: Photo?
	var imageView: UIImageView!
	var label: UILabel!
	
	func setUpSubViews() {
		
		// Image
		
		let imageView = photo?.imageData
		let label = photo?.title
		addSubview(imageView)
		addSubview(label)
		
		NSLayoutConstraint(item: imageView,
						   attribute: .leading,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .leading,
						   multiplier: 1,
						   constant: 4).isActive = true
		
		NSLayoutConstraint(item: imageView,
						   attribute: .trailing,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .trailing,
						   multiplier: 1,
						   constant: -4).isActive = true
		
		NSLayoutConstraint(item: imageView,
						   attribute: .height,
						   relatedBy: .equal,
						   toItem: imageView,
						   attribute: .width,
						   multiplier: 1,
						   constant: 0).isActive = true
		
		NSLayoutConstraint(item: label,
						   attribute: .leading,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .leading,
						   multiplier: 1,
						   constant: 8).isActive = true
		
		NSLayoutConstraint(item: label,
						   attribute: .trailing,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .trailing,
						   multiplier: 1,
						   constant: -6).isActive = true
		
		NSLayoutConstraint(item: label,
						   attribute: .height,
						   relatedBy: .equal,
						   toItem: imageView,
						   attribute: .width,
						   multiplier: 1,
						   constant: 0).isActive = true
		
		self.imageView = imageView
		self.label = label
		
	}
	
	private func updateViews() {
		imageView.image = photo.image
		nameLabel.text = photo?.title
	}
    
}
