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
        setUpSubViews()
        setTheme()
        updateViews()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    
    @objc private func addImage() {
        let imagePick = UIImagePickerController()
        imagePick.delegate = self
        
        let action = UIAlertController(title: "Photo Access", message: "please select your photo source", preferredStyle: .actionSheet)
        
        action.addAction(UIAlertAction(title: "camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePick.sourceType = .camera
                self.present(imagePick, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "camera unavail", message: "no camera", preferredStyle: .alert)
                let act = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(act)
                self.present(alert, animated: true, completion: nil)
            }
        }))
        action.addAction(UIAlertAction(title: "photo library", style: .default, handler: { (action: UIAlertAction) in
            imagePick.sourceType = .photoLibrary
            self.present(imagePick, animated: true, completion: nil)
        }))
        action.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(action, animated: true, completion: nil)
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
        let saveButton = UIBarButtonItem(title: "save photo", style: .done, target: self, action: #selector(savePhoto))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
        
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.cornerRadius = 20
        addButton.backgroundColor = .darkGray
        addButton.setTitle("add photo", for: .normal)
        addButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        view.addSubview(addButton)
        
        addButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "image title"
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 8
        textField.clipsToBounds = true
        
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        navigationItem.setRightBarButton(saveButton, animated: false)
        
        self.imageView = imageView
        self.titleTextField = textField
        
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
