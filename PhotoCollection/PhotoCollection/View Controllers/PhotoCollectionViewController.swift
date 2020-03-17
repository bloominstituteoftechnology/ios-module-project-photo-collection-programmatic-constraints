//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
        setTheme()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
        
        return cell
    }
    
    private func setTheme() {
    
        guard let themePreference = themeHelper.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            break
        }
        
        collectionView?.backgroundColor = backgroundColor
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case "SelectTheme":
            
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            
            destinationVC.themeHelper = themeHelper
            
        case "CreatePhoto":
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            destinationVC.delegate = self
            
        case "ViewPhoto":
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            
            destinationVC.photo = photoController.photos[indexPath.row]
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            destinationVC.delegate = self
            
        default:
            break
        }
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let theInsets = (UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0,
        right: 20.0))
        return theInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      return CGSize(width: 170, height: 200)
    }
}

extension PhotoCollectionViewController: AddPhotoDelegate {
    func photoWasAdded(_ photo: Photo) {
        photoController.createPhoto(with: photo.imageData, title: photo.title)
        collectionView.reloadData()
    }
    
    func photoWasUpdated(oldPhoto: Photo, title: String, imageData: Data) {
        photoController.update(photo: oldPhoto, with: imageData, and: title)
        collectionView.reloadData()
    }
}


