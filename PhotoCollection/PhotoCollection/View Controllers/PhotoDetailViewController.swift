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
    var addImageButton: UIButton!
    
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
    
    private func setUpSubViews() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        addImageButton = UIButton()
        addImageButton.setTitle("Add Image", for: .normal)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addImageButton)
        
        titleTextField = UITextField()
        titleTextField.placeholder = "Give this photo a title:"
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        
        let imageMargin: CGFloat = 10
        // that feeling when you realize you've misread the directions and done the opposite of what they've asked...
//        imageView.topAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.topAnchor,
//            constant: -imageMargin
//        ).isActive = true
//        imageView.leadingAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
//            constant: imageMargin
//        ).isActive = true
//        imageView.trailingAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
//            constant: -imageMargin
//        ).isActive = true
//        imageView.heightAnchor.constraint(
//            equalTo: imageView.widthAnchor
//        ).isActive = true
        let imageConstraints = [
            NSLayoutConstraint(
                item: imageView!,
                attribute: .top,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .top,
                multiplier: 1,
                constant: -imageMargin
            ), NSLayoutConstraint(
                item: imageView!,
                attribute: .leading,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .leading,
                multiplier: 1,
                constant: imageMargin
            ), NSLayoutConstraint(
                item: imageView!,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .trailing,
                multiplier: 1,
                constant: imageMargin
            ), NSLayoutConstraint(
                item: imageView!,
                attribute: .height,
                relatedBy: .equal,
                toItem: imageView!,
                attribute: .width,
                multiplier: 1,
                constant: 0
            )
        ]
        NSLayoutConstraint.activate(imageConstraints)
//        addImageButton.topAnchor.constraint(
//            equalTo: imageView.bottomAnchor,
//            constant: -imageMargin
//        ).isActive = true
//        addImageButton.leadingAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
//            constant: imageMargin
//        ).isActive = true
//        addImageButton.bottomAnchor.constraint(
//            greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
//            constant: imageMargin
//        ).isActive = true
        let addImageButtonConstraints = [
            NSLayoutConstraint(
                item: addImageButton!,
                attribute: .top,
                relatedBy: .equal,
                toItem: imageView,
                attribute: .bottom,
                multiplier: 1,
                constant: -imageMargin
            ), NSLayoutConstraint(
                item: addImageButton!,
                attribute: .leading,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .leading,
                multiplier: 1,
                constant: imageMargin
            ), NSLayoutConstraint(
                item: addImageButton!,
                attribute: .bottom,
                relatedBy: .greaterThanOrEqual,
                toItem: view.safeAreaLayoutGuide,
                attribute: .bottom,
                multiplier: 1,
                constant: imageMargin
            )
        ]
        NSLayoutConstraint.activate(addImageButtonConstraints)
//        titleTextField.topAnchor.constraint(
//            equalTo: imageView.bottomAnchor,
//            constant: -imageMargin
//        ).isActive = true
//        titleTextField.bottomAnchor.constraint(
//            greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
//            constant: imageMargin
//        ).isActive = true
//        titleTextField.leadingAnchor.constraint(
//            equalTo: addImageButton.trailingAnchor,
//            constant: imageMargin
//        ).isActive = true
//        titleTextField.trailingAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
//            constant: -imageMargin
//        ).isActive = true
        let titleTextFieldConstraints = [
            NSLayoutConstraint(
                item: titleTextField!,
                attribute: .top,
                relatedBy: .equal,
                toItem: imageView,
                attribute: .bottom,
                multiplier: 1,
                constant: -imageMargin
            ), NSLayoutConstraint(
                item: titleTextField!,
                attribute: .bottom,
                relatedBy: .greaterThanOrEqual,
                toItem: view.safeAreaLayoutGuide,
                attribute: .bottom,
                multiplier: 1,
                constant: imageMargin
            ), NSLayoutConstraint(
                item: titleTextField!,
                attribute: .leading,
                relatedBy: .equal,
                toItem: addImageButton,
                attribute: .trailing,
                multiplier: 1,
                constant: imageMargin
            ), NSLayoutConstraint(
                item: titleTextField!,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .trailing,
                multiplier: 1,
                constant: -imageMargin
            )
        ]
        NSLayoutConstraint.activate(titleTextFieldConstraints)
    }
}
