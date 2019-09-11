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
    var photoImage: UIImageView!
    var nameLabel: UILabel!
    
    //MARK: - private Methods
    private func SetupSubViews() {
        let cellStackView = UIStackView(arrangedSubviews: [photoImage,nameLabel])
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.axis = .vertical
        
        let leadingConstraint = NSLayoutConstraint(item: cellStackView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0)
        
        let trailingConstraint = NSLayoutConstraint(item: cellStackView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: cellStackView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: cellStackView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([leadingConstraint,trailingConstraint,topConstraint,bottomConstraint])
        self.contentView.addSubview(cellStackView)
    }
    
    private func updateViews() {
        guard let photo = photo else {return}
        photoImage.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupSubViews()
    }
}
