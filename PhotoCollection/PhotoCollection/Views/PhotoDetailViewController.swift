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
    
    var imageView = UIImageView()
    
    var addImageButton: UIButton!
    var photoTitleTextField: UITextField!
    var savePhotoButton: UIBarButtonItem!
    
    
    var photo: Photo? {
        didSet {
            setUpSubViews()
        }
    }
    
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        setUpSubViews()
     //   updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
        setTheme()
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
            let title = photoTitleTextField.text else { return }
        
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
             self.imageView.image = UIImage(named: "emptyImage")
            addImageButton.setTitle("Add Image", for: .normal)
            photoTitleTextField.placeholder = "Add Title of Photo"
            photoTitleTextField.backgroundColor = UIColor.white.withAlphaComponent(0.65)
            return
        }
        
        title = photo.title
        imageView.image = UIImage(named: "")
        imageView.image = UIImage(data: photo.imageData)
        photoTitleTextField.text = photo.title
        addImageButton.setTitle("Change Yo Image", for: .normal)
    }
    /// This sets up the UI buttons and labels
    private func setUpSubViews() {
        
        let savePhotoButton = UIBarButtonItem(title: "Save Da Photo", style: .done, target: self, action: #selector(savePhoto))
        navigationItem.rightBarButtonItem = savePhotoButton
        
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        self.imageView = imageView
        // y
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        
        // x
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65).isActive = true
        
        // width
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -65).isActive = true
        
        // height
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        let addImageButton = UIButton(type: .system)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        view.addSubview(addImageButton)
        self.addImageButton = addImageButton
        
         // y
        addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        // x
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
 
        let photoTitleTextField = UITextField()
        photoTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(photoTitleTextField)
        photoTitleTextField.backgroundColor = .clear
        photoTitleTextField.textAlignment = .center
        photoTitleTextField.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        self.photoTitleTextField = photoTitleTextField
        
        // y
        photoTitleTextField.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 8).isActive = true
        
        // x
        photoTitleTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        // width
        photoTitleTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15).isActive = true
    }
    
    
    @objc private func presentImagePickerController() {
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
        case "Yellow":
            backgroundColor = .yellow
        case "Green":
            backgroundColor = .green
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
}
