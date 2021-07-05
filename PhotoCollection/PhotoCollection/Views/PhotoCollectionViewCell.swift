//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
        
        var photo: Photo? {
            didSet {
                updateViews()
            }
        }
        
    private func updateViews() {
        
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
        
        
        func setUpSubViews() {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            
            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
                
                ])
            
            self.imageView = imageView
            
            let label = UILabel()
            label.textAlignment = .center
            
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                NSLayoutConstraint(item: label,
                                   attribute: .top,
                                   relatedBy: .equal,
                                   toItem: imageView,
                                   attribute: .bottom,
                                   multiplier: 1,
                                   constant: 4),
                NSLayoutConstraint(item: label,
                                   attribute: .leading,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .leading,
                                   multiplier: 1,
                                   constant: 2),
                NSLayoutConstraint(item: label,
                                   attribute: .trailing,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .trailing,
                                   multiplier: 1,
                                   constant: -2)
                
                ])
            
            self.nameLabel = label
        }
        
}
