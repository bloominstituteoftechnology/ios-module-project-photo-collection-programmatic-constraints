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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    setUpSubViews()
    @IBOutlet weak var photoViewImage: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!


 func setUpSubViews() {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    
    
    NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
    NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 4).isActive = true
    NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -4).isActive = true
    NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0).isActive = true
    
    
    self.photoViewImage = imageView
    
    let label = UILabel()
    
    label.adjustsFontForContentSizeCategory = false
    label.textAlignment = .center
    addSubview(label)
    
    NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 4).isActive = true
    NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self , attribute: .leading, multiplier: 1, constant: 2).isActive = true
    NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -2).isActive = true
    
    self.photoTitleLabel = label
    
}
    
    func updateViews() {
        guard let photo = photo else { return }
        photoViewImage.image = UIImage(data: photo.imageData)
        photoTitleLabel.text = photo.title
    }
    
}
