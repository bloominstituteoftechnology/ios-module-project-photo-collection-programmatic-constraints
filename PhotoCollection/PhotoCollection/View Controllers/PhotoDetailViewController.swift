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
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubViews()
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
        
        addImageButton = UIButton(type: .system)
        addImageButton.setTitle("Add Image", for: .normal)
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addImageButton)
        
        titleTextField = UITextField()
        titleTextField.placeholder = "Give this photo a title:"
        titleTextField.borderStyle = .roundedRect
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        
        let imageMargin: CGFloat = 40
        let interItemMargin: CGFloat = 8

        // putting button/field above image so keyboard doesn't get in the way
        let addImageButtonConstraints = [
            NSLayoutConstraint(
                item: addImageButton!,
                attribute: .top,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .top,
                multiplier: 1,
                constant: interItemMargin
            ), NSLayoutConstraint(
                item: addImageButton!,
                attribute: .leading,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide,
                attribute: .leading,
                multiplier: 1,
                constant: imageMargin
            )
        ]
        addImageButton.setContentHuggingPriority(
            addImageButton.contentHuggingPriority(for: .horizontal) + 1,
            for: .horizontal
        )
        NSLayoutConstraint.activate(addImageButtonConstraints)
        
        let titleTextFieldConstraints = [
            NSLayoutConstraint(
                item: titleTextField!,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: addImageButton,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            ), NSLayoutConstraint(
                item: titleTextField!,
                attribute: .leading,
                relatedBy: .equal,
                toItem: addImageButton,
                attribute: .trailing,
                multiplier: 1,
                constant: interItemMargin
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
        
        let imageConstraints = [
            NSLayoutConstraint(
                item: imageView!,
                attribute: .top,
                relatedBy: .greaterThanOrEqual,
                toItem: titleTextField,
                attribute: .bottom,
                multiplier: 1,
                constant: interItemMargin
            ), NSLayoutConstraint(
                item: imageView!,
                attribute: .top,
                relatedBy: .greaterThanOrEqual,
                toItem: addImageButton,
                attribute: .bottom,
                multiplier: 1,
                constant: interItemMargin
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
                constant: -imageMargin
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
        
        let saveButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(savePhoto)
        )
        navigationItem.rightBarButtonItem = saveButton
    }
}
