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
    
    private func setUpSubviews(){
            
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 4).isActive = true
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                              multiplier: 1,
                                              constant: 0).isActive = true
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            self.imageView = imageView
            
            
            let addPhotoButton = UIButton(type: .system)
            addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
            addPhotoButton.setTitle("Add Photo", for: .normal)
            view.addSubview(addPhotoButton)
            addPhotoButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
            addPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
            addPhotoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
     
            let textField = UITextField()
            textField.placeholder = "Give this photo a title: "
            textField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(textField)
            textField.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 2).isActive = true
            textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            textField.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0).isActive = true
            textField.backgroundColor = .systemBackground
            self.titleTextField = textField
           
            
            let barButton = UIBarButtonItem(title: "Save Photo", style: .plain, target: .none, action: #selector(savePhoto))
            self.navigationItem.setRightBarButton(barButton, animated: true)
            
            
            
           
                   
            //        let labelHeightAnchor = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
            //
            
            
            
            
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
                DispatchQueue.main.async {
                    self.presentImagePickerController()
                }
            }
        case .denied:
            return
        case .restricted:
            return
        @unknown default:
            print("A new Xcode or Swift update has created an unkown error.")
        }
    }
    
    @objc private func savePhoto() {
        
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = titleTextField.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, with: imageData, and: title)
            imageView.reloadInputViews()
        } else {
            photoController?.createPhoto(with: imageData, title: title)
            imageView.reloadInputViews()
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
