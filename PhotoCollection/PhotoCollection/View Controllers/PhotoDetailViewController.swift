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
    
    var photo: Photo!
    var photoController: PhotoController!
    var themeHelper: ThemeHelper!
    
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
    
    func setUpSubviews() {
        
        //TODO: See if you have to use the imageView and the titleTextField from above or not, or if you need to declare new once here..
        let photoImage = UIImageView()
        let addImageButton = UIButton()
        let titleTextField2 = UITextField()
        let saveButton = UIBarButtonItem()
        
        view.addSubview(addImageButton)
        view.addSubview(photoImage)
        view.addSubview(titleTextField2)
        
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        titleTextField2.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: self?
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        titleTextField2.placeholder = "Image Title"
        saveButton.title = "Save Photo"
        saveButton.action = #selector(savePhoto)
        
        navigationItem.rightBarButtonItem = saveButton
        
        photoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        photoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        addImageButton.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 20).isActive = true
        addImageButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        titleTextField2.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 15).isActive = true
        titleTextField2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    
    // TODO: Create an updateViews() function that passes the information from the Photo to the image view and text field. Call this function sometime after the photo variable has been given a value from the cellForItem at method in the PhotosCollectionViewController. Again, there are a couple places you could decide to do this.
    private func updateViews(image: Data, title: String) {
        guard let photoImage = photo?.imageData,
            let title = photo?.title else { return }
        
        titleTextField.text = title
        imageView.image = UIImage(data: photoImage)
    }
    
//    private func updateViews() {
//        guard let photo = photo else { return }
//        imageView.image = UIImage(data: photo.imageData)
//        titleTextField.text = photo.title
//
//    }



}
