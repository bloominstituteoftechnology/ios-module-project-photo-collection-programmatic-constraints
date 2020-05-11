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
    let backgroundView = UIView()
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setTheme()
        updateViews()
        setUpRightNavBarButtons()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
    private func setUpSubviews() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.view.addSubview(backgroundView)
        self.view.sendSubviewToBack(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
        addImageButton = UIButton(type: .system)
        addImageButton.setTitle("Add Photo", for: .normal)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        self.view.addSubview(addImageButton)
        
        addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        addImageButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        addImageButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25).isActive = true
        addImageButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        titleTextField = UITextField()
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "Give this photo a title:"
        titleTextField.backgroundColor = .white
        self.view.addSubview(titleTextField)
        
        titleTextField.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 16).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    private func setUpRightNavBarButtons() {
        let rightButton = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(savePhoto))
        
        self.navigationItem.rightBarButtonItems = [rightButton]
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
        
   //     view.backgroundColor = backgroundColor
        self.backgroundView.backgroundColor = backgroundColor

    }
}
