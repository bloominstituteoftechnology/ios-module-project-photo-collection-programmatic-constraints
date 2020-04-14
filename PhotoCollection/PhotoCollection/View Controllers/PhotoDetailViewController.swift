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
        setUpSubviews()
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
}

extension PhotoDetailViewController {
    func setUpSubviews() {
        
        
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
        self.imageView = image
        
        //Button
        let addButton = UIButton(type: .system)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add Image", for: .normal)
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        addButton.layer.cornerRadius = addButton.frame.size.height/2

        view.addSubview(addButton)
        
        addButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        addButton.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 70).isActive = true
        addButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -70).isActive = true
        
        //Text Field
        let titleTextField = UITextField()
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "Set photo title:"
        titleTextField.backgroundColor = .white
        titleTextField.borderStyle = .roundedRect
        self.titleTextField = titleTextField
        
        view.addSubview(titleTextField)
        
        titleTextField.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -50).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 50).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(savePhoto))
    }
    

}
