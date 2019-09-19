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
        setupSubviews()
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
    
    func enableImage(on: UIImageView) {
        on.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func enableButton(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // xcode told me to add @objc :(
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
            title = "Add New Photo"
            return
        }
        
        title = photo.title
        
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    // xcode asked me to add @objc here. will investigate later
    @objc private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func setTheme() {
        guard let selectedTheme = themeHelper?.selectedTheme else { return }
        
        var backgroundColor: UIColor!
        var uiNavigationBarBackroundColor: UIColor!
        
        switch selectedTheme {
        case "Dark":
            backgroundColor = .gray
            uiNavigationBarBackroundColor = .gray
        case "Blue":
            backgroundColor = .blue
            uiNavigationBarBackroundColor = .blue
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
        // need to add navigation bar background color for satisfaction
    }
    
    private func setupSubviews () {
        
        // create image view
        let imageView = UIImageView()
        
        // disable autoresizing (can I make a func for this somehow?)
        // attempt below
        

        
        enableImage(on: imageView)
        
        // function above does the same as below. Could create a function for each type to disable, since I know no other way yet.
        
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //add image to subview
        view.addSubview(imageView)
        
        
        imageView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        self.imageView = imageView
        
        let button = UIButton(type: .roundedRect)
        
        button.backgroundColor = .white
        
        button.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5, constant: 1.0)
        

        
        enableButton(button: button)
        button.setTitle("Add New Image", for: .normal)
        
        button.addTarget(self, action: #selector(presentImagePickerController), for: .touchUpInside)
        view.addSubview(button)
        
        button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = .white
        textField.textColor = .white
        textField.text = "Title:"
        
        view.addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
        
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 150).isActive = true
        
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
        
        titleTextField = textField
        
        let barButtonItem = UIBarButtonItem(title: "Save Photo", style: .plain, target: self, action: #selector(savePhoto))
        self.navigationItem.setRightBarButton(barButtonItem, animated: false)
    }
    
}
