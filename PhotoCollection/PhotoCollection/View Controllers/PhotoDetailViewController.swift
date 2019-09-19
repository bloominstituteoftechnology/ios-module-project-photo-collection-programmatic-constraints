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
//        setUpDetailSubViews()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    @objc
    private func addImage() {
        
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
    
    @objc
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
    
    func setUpDetailSubViews() {
//        let container = UILayoutGuide()
//        view.addLayoutGuide(container)
//        let margins = view.layoutMarginsGuide
        imageView = UIImageView()
        //detailImage.backgroundColor = .blue
        imageView.backgroundColor = .darkGray
        view.addSubview(imageView)
        
        let addImageButton = UIButton()
        //let textStyle = NSMutableParagraphStyle.default.alignment
        addImageButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        addImageButton.setTitle("Add Image", for: .normal)
        view.addSubview(addImageButton)
        addImageButton.addTarget(self, action: #selector(addImage), for: UIControl.Event.touchUpInside)
        
        titleTextField = UITextField()
        titleTextField.backgroundColor = .white
        titleTextField.placeholder = "Give this photo a title:"
        view.addSubview(titleTextField)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false

        // Image Constraints
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 240.0).isActive = true
//        detailImage.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -120.0).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        // Button Constraints
        addImageButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0).isActive = true
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        addImageButton.trailingAnchor.constraint(equalTo: detailImage.trailingAnchor, constant: 0.0).isActive = true
        
        // Text Field Constraints
        titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        detailTextField.trailingAnchor.constraint(equalTo: addImageButton.trailingAnchor, constant: 0.0).isActive = true
        titleTextField.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 20.0).isActive = true
        titleTextField.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20.0).isActive = true
        
        let saveImageButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePhoto))
        navigationItem.setRightBarButton(saveImageButton, animated: true)
        
    }
}
