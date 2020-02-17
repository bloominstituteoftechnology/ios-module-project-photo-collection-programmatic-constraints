//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    func createPhoto(with imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func update(photo: Photo, with imageData: Data, and title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var scratch = photo
        
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
    }
    
    
    var photos: [Photo] = []
}
