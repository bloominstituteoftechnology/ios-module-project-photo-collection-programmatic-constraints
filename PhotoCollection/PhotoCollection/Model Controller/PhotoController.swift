//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
      var photos: [Photo] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createPhoto(with imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
        saveToPersistentStore()
    }
    
    func update(photo: Photo, with imageData: Data, and title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var scratch = photo
        
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
        saveToPersistentStore()
    }
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("photoList.plist")
    }
    
    func loadFromPersistentStore() {
     
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        do {
            let data =  try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            photos =  try decoder.decode([Photo].self, from: data)
        } catch {
            print("Error loading photos data: \(error)")
        }
    }

    func saveToPersistentStore() {

        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(photos)
            try data.write(to: url)
        } catch {
            print("Error saving photos data: \(error)")
        }
    }
    
  
}
