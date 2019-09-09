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
		didSet{
			updateViews()
		}
	}
	private var imageView: UIImageView!
	private var label: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpSubViews()
	}
	
	func setUpSubViews() {
		
		// Image
		
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		
		addSubview(imageView)
		
		NSLayoutConstraint(item: imageView,
						   attribute: .top,
						   relatedBy: .equal,
						   toItem: safeAreaLayoutGuide,
						   attribute: .top,
						   multiplier: 1,
						   constant: -8).isActive = true
		
		NSLayoutConstraint(item: imageView,
						   attribute: .leading,
						   relatedBy: .equal,
						   toItem: safeAreaLayoutGuide,
						   attribute: .leading,
						   multiplier: 1,
						   constant: 8).isActive = true
		
		NSLayoutConstraint(item: imageView,
						   attribute: .trailing,
						   relatedBy: .equal,
						   toItem: safeAreaLayoutGuide,
						   attribute: .trailing,
						   multiplier: 1,
						   constant: -8).isActive = true
		
		NSLayoutConstraint(item: imageView,
						   attribute: .height,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .height,
						   multiplier: 1,
						   constant: 0).isActive = true
		
		self.imageView = imageView
		
		// Label
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		
		addSubview(label)
		
		NSLayoutConstraint(item: label,
						   attribute: .top,
						   relatedBy: .equal,
						   toItem: safeAreaLayoutGuide,
						   attribute: .bottom,
						   multiplier: 1,
						   constant: 6).isActive = true
		
		NSLayoutConstraint(item: label,
						   attribute: .leading,
						   relatedBy: .equal,
						   toItem: safeAreaLayoutGuide,
						   attribute: .leading,
						   multiplier: 1,
						   constant: 4).isActive = true
		
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
		
	}
    
}
