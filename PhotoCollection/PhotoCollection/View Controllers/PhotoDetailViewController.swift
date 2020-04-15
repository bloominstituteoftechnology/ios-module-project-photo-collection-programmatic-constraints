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
    
    //Functions
    func setUpSubviews() {
        
        //Create Objects and set their properties
        imageView = UIImageView()
        titleTextField = UITextField()
        let buttonPressed = UIButton(type: .system)
        let barButton = UIBarButtonItem(title: "Save Photo", style: .plain, target: self, action: #selector(savePhoto))
        
        //Add SubViews
        view.addSubview(imageView)
        view.addSubview(buttonPressed)
        view.addSubview(titleTextField)
        
        //Properties
        titleTextField.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = barButton
        buttonPressed.setTitle("Add Image", for: .normal)
        buttonPressed.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        buttonPressed.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "Give this photo a title: "
        
        //Constraints using Anchors
        //ImageView
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5, constant: 0.0).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15, constant:  0.0).isActive = true
        
        //TextField
        titleTextField.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0.00).isActive = true
        titleTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: imageView.heightAnchor, constant: 0.00).isActive = true
        
        //Button
        buttonPressed.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor, constant: 0.0).isActive = true
        buttonPressed.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8.0).isActive = true
        buttonPressed.widthAnchor.constraint(equalTo: titleTextField.widthAnchor, multiplier: 1.0, constant: 0.0).isActive = true
        
        
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
