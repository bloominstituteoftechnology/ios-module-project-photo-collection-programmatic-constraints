//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
//        setUpSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
//    override func awakeFromNib() {
//        setUpSubviews()
//    }
    
    var photo: Photo?
    
//    var myImageView: UIImageView = {
//        let imageView = UIImageView()
//        setUpSubviews()
//        return imageView
//    }()
    
    let myImageView = UIImageView()
    let titleLabel = UILabel()
    
//    func setUpSubviews(for myImageView: UIImageView) {
    func setUpSubviews() {
        
        contentView.addSubview(myImageView)
        contentView.addSubview(titleLabel)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //myImageView.backgroundColor = .blue
        let imageConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: myImageView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant:  0.0),
            NSLayoutConstraint(item: myImageView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant:  0.0),
//            NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1.0, constant:  80.0),
            NSLayoutConstraint(item: myImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: myImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: myImageView, attribute: .bottom, multiplier: 1.0, constant: 8.0),
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: myImageView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
        myImageView.addConstraints(imageConstraints)
        titleLabel.addConstraints(imageConstraints)
    }
    
    func updateViews() {
        
        guard let photo = photo else { return }
        myImageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
        
    }
}
