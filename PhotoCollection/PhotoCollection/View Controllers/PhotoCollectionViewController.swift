//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
    }
    
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
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 320, height: 320)  // how big is the cell
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10 // spacing between cells
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        
        //         collectionView.dataSource = self  // allowing us to use the UICollectionViewDataSource delgate
        
        collectionView.backgroundColor = .white
        
        self.collectionView = collectionView
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
            
        case "ViewPhoto":
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            
            destinationVC.photo = photoController.photos[indexPath.row]
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            
        default:
            break
        }
    }
}

//extension PhotoCollectionViewController: SettingsDelegate {
//    func settingsWereUpdated() {
//        collectionView?.reloadData()
//        
//    }
//}
