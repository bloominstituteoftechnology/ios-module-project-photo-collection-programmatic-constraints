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
        setUpSubViews()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
        private func setUpSubViews() {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        self.imageView = imageView
        view.addSubview(imageView)
        
        let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Image", for: .normal)
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
//        view.addSubview(button)
        
        let textField  = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = "Give This Photo A Title"
            view.addSubview(textField)
        
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30).isActive = true
           textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            textField.widthAnchor.constraint(equalToConstant: 180).isActive = true
            textField.heightAnchor.constraint(equalToConstant: 180).isActive = true

            self.imageView = imageView
            self.titleTextField = textField
            
            let savePhotoBarButtonItem = UIBarButtonItem(title: "Save Photo", style: .plain, target: self, action: #selector(savePhoto))
            navigationItem.setRightBarButton(savePhotoBarButtonItem, animated: false)
        
        
        
        
        
        
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
        
      
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
            self.present(imagePicker, animated: true, completion: nil)
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
