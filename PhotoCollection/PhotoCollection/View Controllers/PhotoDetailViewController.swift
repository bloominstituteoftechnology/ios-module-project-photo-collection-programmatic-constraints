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
    
    private func setUpSubViews() {
        let imageView = UIImageView()
        let textField = UITextField()
        let addButton = UIButton()
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePhoto))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "give this photo a title"
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("add photo", for: .normal)
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(addButton)
        view.addSubview(textField)
        
        navigationItem.setRightBarButton(saveButton, animated: false)
        
        //  imageView constraints
        let imageViewCenterX = imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        let imageViewHeight = imageView.heightAnchor.constraint(equalToConstant: 100)
        let imageViewWidth = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 2)
        let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80)
        
        //  button constraints
        let buttonCenterXConstraint = NSLayoutConstraint(item: addButton,
                                                         attribute: .centerX,
                                                         relatedBy: .equal,
                                                         toItem: view.safeAreaLayoutGuide,
                                                         attribute: .centerX,
                                                         multiplier: 1,
                                                         constant: 0)
        
        let buttonTopConstraint = NSLayoutConstraint(item: addButton,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: imageView,
                                                     attribute: .bottom,
                                                     multiplier: 1,
                                                     constant: 12)
        
        let textFieldLeadingConstraint = textField.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0)
        let textFieldTrailingConstraint = textField.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 0)
        let textFieldTopConstraint = textField.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8)
        
        //  activate constraints
        NSLayoutConstraint.activate([imageViewCenterX,
                                     imageViewTopConstraint,
                                     imageViewWidth,
                                     imageViewHeight,
                                     buttonCenterXConstraint,
                                     buttonCenterXConstraint,
                                     buttonTopConstraint,
                                     textFieldLeadingConstraint,
                                     textFieldTrailingConstraint,
                                     textFieldTopConstraint])
        
        self.imageView = imageView
        self.titleTextField = textField
        
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
