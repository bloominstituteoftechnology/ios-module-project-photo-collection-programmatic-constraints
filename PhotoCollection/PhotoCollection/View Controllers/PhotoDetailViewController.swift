//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout {
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setUpSubviews()
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        setUpSubviews()
//    }
    
    var imageView: UIImageView!
    var titleTextField: UITextField!
    
    var photo: Photo? {
        didSet {
            // The design doc says to call this here, but doing so causes it to try to update views before the subviews are set up in `setUpSubviews()` and thus crashes the application. Because `updateViews()` is already being called after this in `viewDidLoad()`, it should still work as expected without this line.
            //updateViews()
        }
    }
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
        setTheme()
        updateViews()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalPhotos: CGFloat = 2

        let horizontalInsets = collectionView.contentInset.left + collectionView.contentInset.right
        
        let itemSpacing = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * (horizontalPhotos - 1)
        
        let width = (collectionView.frame.width - horizontalInsets - itemSpacing) / horizontalPhotos
        return CGSize(width: width, height: width * 1.2)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
    private func setUpSubviews() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1)
        ])
        
        self.imageView = imageView
        
        let addImageButton = UIButton()
        addImageButton.setTitle("Add Image", for: .normal)
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addImageButton)
        
        NSLayoutConstraint.activate([
            addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            addImageButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0)
        ])
        
        let titleTextField = UITextField()
        titleTextField.placeholder = "Photo title"
        titleTextField.contentMode = .left
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        
        self.titleTextField = titleTextField
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 8),
            titleTextField.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0),
            titleTextField.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0),
            titleTextField.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0)
        ])
        
        let savePhotoButton = UIBarButtonItem()
        savePhotoButton.title = "Save Photo"
        savePhotoButton.action = #selector(savePhoto)
        navigationItem.rightBarButtonItem = savePhotoButton
    }
    
    @objc private func addImage() {
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
    
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
            
        case .notDetermined:
            
            PHPhotoLibrary.requestAuthorization { (status) in
                
                guard status == .authorized else {
                    NSLog("User did not authorize access to the photo library")
                    return
                }
                self.presentImagePickerController()
            }
        default:
            break
        }
    }
    
    @objc private func savePhoto() {
        
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = titleTextField.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, with: imageData, and: title)
        } else {
            photoController?.createPhoto(with: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        
        guard let photo = photo else {
            title = "Create Photo"
            return
        }
        
        title = photo.title
        
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
}
