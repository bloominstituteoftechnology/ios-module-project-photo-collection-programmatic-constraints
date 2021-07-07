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
    var button: UIButton!
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        updateViews()
    }
    
    func setUpSubviews() {
        imageView = UIImageView()
        titleTextField = UITextField()
        button = UIButton()
        
        
        view.addSubview(button)
        view.addSubview(imageView)
        view.addSubview(titleTextField)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        titleTextField.backgroundColor = .white
        titleTextField.textColor = .black
        titleTextField.placeholder = "Give photo a title"
        
        
        button.setTitle("Add Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        button.backgroundColor = .blue
        
        
        let constraints = [
            NSLayoutConstraint(item: button, attribute: .topMargin, relatedBy: .equal, toItem: imageView, attribute: .bottomMargin, multiplier: 1.0, constant: 60.0),
            NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: -150.0),
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 300.0),
            NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 300.0),
            NSLayoutConstraint(item: titleTextField, attribute: .topMargin, relatedBy: .equal, toItem: button, attribute: .bottomMargin, multiplier: 1.0, constant: 60.0),
            NSLayoutConstraint(item: titleTextField, attribute: .leading, relatedBy: .equal, toItem: button, attribute: .leading, multiplier: 1.0, constant: -40.0),
            NSLayoutConstraint(item: titleTextField, attribute: .trailing, relatedBy: .equal, toItem: button, attribute: .trailing, multiplier: 1.0, constant: 40.0)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = "Save"
        barButtonItem.action = #selector(savePhoto)
        
        navigationItem.setRightBarButton(barButtonItem, animated: true)
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
    
    func updateViews() {
        setUpSubviews()
        guard let photo = photo else {
            title = "Create Photo"
            return
        }
        button.isHidden = true
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
