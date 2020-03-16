//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos
import SwiftUI


class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @UseAutoLayout var imageView = UIImageView()
    @UseAutoLayout var selectPhotoButton = UIButton()
    @UseAutoLayout var titleTextField = UITextField()
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        setupViews()
        updateViews()
    }
    
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(selectPhotoButton)
        view.addSubview(titleTextField)
        
        //imageView.backgroundColor = .yellow
        imageView.image = UIImage(systemName: "x.square")
        imageView.tintColor = .lightGray
        imageView.preferredSymbolConfiguration = .init(weight: .thin)
        imageView.contentMode = .scaleAspectFit
        
        selectPhotoButton.setTitle("Select a Photo", for: .normal)
        selectPhotoButton.setTitleColor(.systemBlue, for: .normal)
        selectPhotoButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "Give your photo a name"
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.3),
            selectPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            selectPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            titleTextField.topAnchor.constraint(equalTo: selectPhotoButton.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePhoto))
    }
    
    @objc func addImage() {
        
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
                DispatchQueue.main.async {
                    self.presentImagePickerController()
                }
            }
        default:
            break
        }
    }
    
    @objc func savePhoto() {
        
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

struct ViewWrapper: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ViewWrapper>) -> UIView {
        return PhotoDetailViewController().view
    }
    
    func updateUIView(_ uiView: ViewWrapper.UIViewType, context: UIViewRepresentableContext<ViewWrapper>) {
    }
}

struct ViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ViewWrapper()
    }
}
