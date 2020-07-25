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
    var titleTextField = UITextField(frame: CGRect())
    var saveButton = UIBarButtonItem()
    
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
    
    private func setUpSubviews() {
         
        
        
            // Button
            // 1. Create/configure
            let addImageButton = UIButton(type: .system)
            addImageButton.translatesAutoresizingMaskIntoConstraints = false
            addImageButton.setTitle("Add Image", for: .normal)
            addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
            titleTextField.placeholder = "Give this photo a title:"
            titleTextField.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
            // 2. Add to view hierarchy
            view.addSubview(addImageButton)
            view.addSubview(imageView)
            view.addSubview(titleTextField)
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .save, target: self.navigationItem.rightBarButtonItem, action: #selector(savePhoto)), animated: true)
        
        
        
            // 3. Create constraints
        let addImageButtonBottomConstraint = addImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        let addImageButtonTrailingConstraint = addImageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        let addImageButtonLeadingConstraint = addImageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let addImageButtonHeightConstraint = addImageButton.heightAnchor.constraint(equalToConstant: 20)
        
        
        //TextField Constraints
        let titleTextFieldTopConstraint = titleTextField.topAnchor.constraint(equalTo: addImageButton.topAnchor, constant: -40)
        let titleTextFieldHorizontal = titleTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        let titleTextFieldHeight = titleTextField.heightAnchor.constraint(equalToConstant: 20)
            
            
        //ImageView Constraints
        
        let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        let imageViewHeight = imageView.heightAnchor.constraint(equalToConstant: 200)
        let imageViewWidth = imageView.widthAnchor.constraint(equalToConstant: 200)
        let imageViewHorizontal = imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        
            
        
            
            // All
            // 4. Activate constraints
            NSLayoutConstraint.activate([addImageButtonBottomConstraint, addImageButtonTrailingConstraint, addImageButtonLeadingConstraint, addImageButtonHeightConstraint, titleTextFieldTopConstraint, titleTextFieldHorizontal, titleTextFieldHeight,   imageViewWidth, imageViewHeight, imageViewTopConstraint, imageViewHorizontal])
            
        }
}
