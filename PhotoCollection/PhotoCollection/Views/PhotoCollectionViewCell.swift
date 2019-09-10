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
	private var photoLabel: UILabel!

	var photo: Photo? {
		didSet {
			updateViews()
		}
	}
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpSubviews()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpSubviews()
	}

	


	private func setUpSubviews() {

		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		imageView.contentMode = .scaleAspectFit
		addSubview(imageView)


		NSLayoutConstraint(item: imageView,
						   attribute: .top,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .top,
						   multiplier: 1,
						   constant: 20).isActive = true

		NSLayoutConstraint(item: imageView,
						   attribute: .leading,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .leading,
						   multiplier: 1,
						   constant: 20).isActive = true

		NSLayoutConstraint(item: imageView,
						   attribute: .height,
						   relatedBy: .equal,
						   toItem: self,
						   attribute: .width,
						   multiplier: 1,
						   constant: 0).isActive = true

		self.imageView = imageView


		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		addSubview(label)



		NSLayoutConstraint(item: label,
						   attribute: .top,
						   relatedBy: .equal,
						   toItem: imageView,
						   attribute: .bottom,
						   multiplier: 1,
						   constant: 10).isActive = true

		NSLayoutConstraint(item: label,
						   attribute: .leading,
						   relatedBy: .equal,
						   toItem: imageView,
						   attribute: .leading,
						   multiplier: 1,
						   constant: 0).isActive = true

		self.photoLabel = label

		
}

	func updateViews() {
		guard let photo = photo else { return }
		imageView.image = UIImage(data: photo.imageData)
		photoLabel.text = photo.title
	}

	func addSubViews() {





	}
}
