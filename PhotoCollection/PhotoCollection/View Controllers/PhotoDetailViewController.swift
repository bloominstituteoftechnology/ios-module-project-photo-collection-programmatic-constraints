//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

protocol AddPhotoDelegate {
    func photoAdded(_ photo: Photo)
    func photoUpdated(oldPhoto: Photo, title: String, imageData: Data)
}

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView!
    var titleTextField: UITextField!
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
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
    
    func setUpSubviews() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        self.imageView = imageView
        
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Give this photo a title:"
        textField.textAlignment = .center
        view.addSubview(textField)
        self.titleTextField = textField
        
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        textField.centerYAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Image", for: .normal)
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePhoto))
        navigationItem.setRightBarButton(saveButton, animated: true)
        
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
