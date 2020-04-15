//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    //Variables
    private var imageView = UIImageView()
    private var nameLabel = UILabel()
    
    var photo: Photo? {
        didSet {
            setUpSubViews()
        }
    }
    
    //Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Functions
    func updateViews() {
        guard let myPhoto = photo else {
            return }
        guard let image = UIImage(data: myPhoto.imageData) else {
            return }
        imageView.image = image
        nameLabel.text = photo?.title
    }
    
    func setUpSubViews() {
        
        //Configure SubView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        nameLabel.textAlignment = .center
        
        nameLabel.textColor = .black
        
        imageView.contentMode = .scaleAspectFill
        nameLabel.numberOfLines = 0
    
        
        //Set SubViews
        addSubview(imageView)
        addSubview(nameLabel)
        
        //Set Constraints
        //ImageView Constraints and Activate
        let imageXC = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let imageYC = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        let imageWC = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.75, constant: 0)
        let imageHC = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.5, constant: 0)
        
        NSLayoutConstraint.activate([imageXC, imageYC, imageWC, imageHC])
        
        //Label Constraints and Activate
        let textXC = NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let textYC = NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 4)
        let textWC = NSLayoutConstraint(item: nameLabel, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1.0, constant: 0.0)
        //let textHC = NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([textXC, textYC, textWC])
        updateViews()
    }
    
}
