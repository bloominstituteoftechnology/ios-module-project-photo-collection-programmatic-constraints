//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        contentView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.25).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
//        contentView.addConstraint(NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: superview?.safeAreaLayoutGuide, attribute: .width, multiplier: 0.5, constant: 0.0))

//        setUpSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpSubviews()
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    var photo: Photo?
//    let view = UIView()
    let myImageView = UIImageView()
    let titleLabel = UILabel()
    
    func setUpSubviews() {
//        contentView.addSubview(view)
        contentView.addSubview(myImageView)
        contentView.addSubview(titleLabel)
    
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .blue
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //myImageView.backgroundColor = .blue
        let imageConstraints: [NSLayoutConstraint] = [
//            NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0),
//            NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0.0),
//            NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>),
            NSLayoutConstraint(item: myImageView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1.0, constant:  0.0),
            NSLayoutConstraint(item: myImageView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant:  0.0),
//            NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1.0, constant:  80.0),
            NSLayoutConstraint(item: myImageView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: myImageView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 0.8, constant: 0.0),
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: myImageView, attribute: .bottom, multiplier: 1.0, constant: 8.0),
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: myImageView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
//        myImageView.addConstraints(imageConstraints)
//        titleLabel.addConstraints(imageConstraints)
    }
    
    func updateViews() {
        
        guard let photo = photo else { return }
        myImageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
        
    }
}
