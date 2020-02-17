//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: - Properties
    var imageView: UIImageView!
     
    
    var titleTextField: UITextField!
    
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setTheme()
        updateViews()
        titleTextField.delegate = self
        
        
    }
  
    
    // Toggle save button when textfield has text
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let value = NSString(string: textField.text!).replacingCharacters(in: range, with: string)

        if value.count > 0 {
            navigationItem.rightBarButtonItem!.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem!.isEnabled = false
        }

        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
 
    
    // MARK: - Constraint programmatically
    private func setUpSubviews() {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
       
        self.imageView = image
        view.addSubview(image)
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add a photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
      
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        view.addSubview(button)
        
        let textField = UITextField()
        textField.placeholder = "Give this photo a cool title..."
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.becomeFirstResponder()
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        self.titleTextField = textField
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save Photo", style: .plain, target: self, action: #selector(savePhoto))
       navigationItem.rightBarButtonItem?.isEnabled = false
        
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 280),
            image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 1),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100),
            button.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            textField.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 50)
     
        
        ])
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
            backgroundColor = .dark
        case "Yellow":
            backgroundColor = .customYellow
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
}


