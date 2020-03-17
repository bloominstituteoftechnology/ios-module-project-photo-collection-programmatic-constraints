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

    // MARK: - Properties
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let themeHelper = themeHelper {
            view.setTheme(with: themeHelper)
        }
        
        setupViews()
        updateViews()
    }
    
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    
    // MARK: - Private
    
    @UseAutoLayout private var imageView = UIImageView()
    @UseAutoLayout private var selectPhotoButton = UIButton()
    @UseAutoLayout private var titleTextField = UITextField()
    
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(selectPhotoButton)
        view.addSubview(titleTextField)
        
        imageView.image = UIImage(systemName: "photo")
        imageView.tintColor = UIColor(white: 1.0, alpha: 0.5)
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
    
    private func updateViews() {
        
        guard let photo = photo else {
            title = "Create Photo"
            return
        }
        
        imageView.image = UIImage(data: photo.imageData)
        
        title = photo.title
        titleTextField.text = photo.title
    }
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    // MARK: - Action Handlers
    
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
                DispatchQueue.main.async {
                    self.presentImagePickerController()
                }
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
}


// MARK: - SwiftUI Preview

struct ViewWrapper: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ViewWrapper>) -> UIView {
        return PhotoDetailViewController().view
    }
    
    func updateUIView(_ uiView: ViewWrapper.UIViewType, context: UIViewRepresentableContext<ViewWrapper>) {
    }
}

struct ViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ViewWrapper().background(Color(white: 0.1)).edgesIgnoringSafeArea(.all)
    }
}
