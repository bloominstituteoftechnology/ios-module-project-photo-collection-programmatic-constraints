//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    private var imageLabel: UILabel?
    private var imageView: UIImageView?
    
    // MARK: - Overrides
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubViews()
    }
    
    // MARK: - Methods
    
    private func updateViews(){
        guard let photo = photo else { return }
        imageView?.image = UIImage(data: photo.imageData)
        imageLabel?.text = photo.title
    }
    
    private func setUpSubViews(){
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        let imageViewTopConstraint = NSLayoutConstraint(item: imageView,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .top,
                                                        multiplier: 1,
                                                        constant: 4)
        let imageViewLeadingConstraint = NSLayoutConstraint(item: imageView,
                                                            attribute: .leading,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .leading,
                                                            multiplier: 1,
                                                            constant: 4)
        let imageViewTrailingComponent = NSLayoutConstraint(item: imageView,
                                                            attribute: .trailing,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .trailing,
                                                            multiplier: 1,
                                                            constant: 4)
        let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                          attribute: .width,
                                                          relatedBy: .equal,
                                                          toItem: imageView,
                                                          attribute: .width, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([imageViewTopConstraint,
                                     imageViewWidthConstraint,
                                     imageViewLeadingConstraint,
                                     imageViewTrailingComponent])
        self.imageView = imageView
        
        let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = "Placeholder Text"
        label.textAlignment = .center
        label.backgroundColor = UIColor.systemGray
        label.backgroundColor?.withAlphaComponent(0.85)
           addSubview(label)
        
        let labelTopConstraint = NSLayoutConstraint(item: label,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: imageView,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: 2)
        let labelLeadingConstraint = NSLayoutConstraint(item: label,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: self,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 2)
        let labelTrailingConstraint = NSLayoutConstraint(item: label,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: self,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: -2)
        NSLayoutConstraint.activate([labelTopConstraint,
                                     labelLeadingConstraint,
                                     labelTrailingConstraint])
        self.imageLabel = label
    }
}
