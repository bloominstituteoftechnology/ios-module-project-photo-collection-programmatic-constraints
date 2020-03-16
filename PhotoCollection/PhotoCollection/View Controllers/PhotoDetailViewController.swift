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
    
    var imageView: UIImageView = UIImageView()
    var titleTextField: UITextField = UITextField()
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        updateViews()
        setUpSubviews()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
    @objc func addImage() {
        
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
    
    private func setUpSubviews() {
        
        // IMAGE VIEW
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        
        // BUTTON
        let addButton = UIButton(type: .system)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add Photo", for: .normal)
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        view.addSubview(addButton)
        
        // TEXT FIELD
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "Give this photo a title:"
        titleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        view.addSubview(titleTextField)
        
        
        let barButton = UIBarButtonItem(title: "Save Photo", style: .done, target: self, action: #selector(savePhoto))
        self.navigationItem.setRightBarButton(barButton, animated: true)

        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        addButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        titleTextField.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        
        
    }
    
    @objc func savePhoto() {
        
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
}
