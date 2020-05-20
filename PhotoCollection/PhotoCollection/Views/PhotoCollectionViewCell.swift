//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    private var imageView = UIImageView()
    private var photoLabel = UILabel()
    var photo: Photo?{
        didSet{
            updateViews()
        }
    }
    
    //MARK: - Initalization
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func updateViews(){
        guard let photo = photo else { return }
        photoLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    
    
    private func setUpSubViews(){
        //Image View
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(imageView)
        
        let yAxisImage = NSLayoutConstraint(item: imageView,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: self,
                                       attribute: .top,
                                       multiplier: 1,
                                       constant: 4)
        let xAxisImage = NSLayoutConstraint(item: imageView,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 4)
        let widthImage =  NSLayoutConstraint(item: imageView,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: -4)
        let heightImage =  NSLayoutConstraint(item: imageView,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: imageView,
                                              attribute: .width,
                                              multiplier: 1,
                                              constant: 0)
        //Label
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.textAlignment = .center
        
        self.addSubview(photoLabel)
        
        let yAxisLabel =  NSLayoutConstraint(item: photoLabel,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: imageView,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 4)
        let xAxisLabel =  NSLayoutConstraint(item: photoLabel,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: imageView,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 4)
        let widthLabel =  NSLayoutConstraint(item: photoLabel,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: -4)
        NSLayoutConstraint.activate([
            yAxisImage,
            xAxisImage,
            widthImage,
            heightImage,
            yAxisLabel,
            xAxisLabel,
            widthLabel
        ])
    }
}
