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
    var titleTextField = UITextField()
    var addImageButton = UIButton()
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
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
    
    func setUpSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        //let addImageButton = UIButton()
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        //var saveButton = UIBarButtonItem()
        
        imageView.contentMode = .scaleAspectFit
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        titleTextField.placeholder = "Give this photo a title"
        titleTextField.borderStyle = .line
        //saveButton.title = "Save Photo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save Photo", style: .plain, target: self, action: #selector(savePhoto))
        //navigationItem.rightBarButtonItem = saveButton
        view.addSubview(imageView)
        view.addSubview(titleTextField)
        view.addSubview(addImageButton)
        
        let width = view.safeAreaLayoutGuide.layoutFrame.size.width - 16
    
        
        //ImageView
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        // ImageButton
        addImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        //addImageButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //addImageButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addImageButton.frame.size.width = width / 2
        addImageButton.frame.size.height = 30
        addImageButton.setTitle("Add Image", for: .normal)
        
    
        //titleTextField
        titleTextField.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        titleTextField.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 8).isActive = true
        titleTextField.widthAnchor.constraint(equalToConstant: 2/3 * width).isActive = true
        
    }
}
