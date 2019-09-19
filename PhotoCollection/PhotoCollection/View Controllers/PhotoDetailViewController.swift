//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView!
    var titleTextField: UITextField!
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        updateViews()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
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
    
    private func savePhoto() {
        
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
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
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
    
    func setupSubviews() {
        //Create UIImageView and add to the superview
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //Create UIButton and add to the superview
        let addNewImageButton = UIButton()
        addNewImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        addNewImageButton.setTitle("Add Image", for: .normal)
        self.view.addSubview(addNewImageButton)
        addNewImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Create UITextField and add to the superview
        let titleTextField = UITextField()
        titleTextField.placeholder = "Give a title to this photo:"
        self.view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //NSLayoutAnchors for imageView property
        let imageViewMargins = view.layoutMarginsGuide
        imageViewMargins.centerYAnchor.constraint(equalTo: imageViewMargins.centerYAnchor).isActive = true
        imageViewMargins.topAnchor.constraint(equalTo: imageViewMargins.topAnchor, constant: 40.0).isActive = true
        imageViewMargins.widthAnchor.constraint(equalTo: imageViewMargins.widthAnchor, multiplier: 0.8).isActive = true
        imageViewMargins.heightAnchor.constraint(equalTo: imageViewMargins.widthAnchor, multiplier: 0.6).isActive = true
        
    }
}
