//
//  UserDefultesHelper.swift
//  Detect
//
//  Created by Esraa on 5/12/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class StorageControler {
    static var tagedFaces = [TagedFace]()
    
    static func save(tagedFace: TagedFace) {
//        if !(locations.map { $0.name}).contains(tagedFace.name) { locations.append(tagedFace) }
        if let encodedTagedFace = try? JSONEncoder().encode(tagedFace) {
            UserDefaults.standard.set(encodedTagedFace, forKey: "SavedFaces")
        }
    }
    
    static func getLocations() -> [TagedFace] {
        if let decodedLocations = try? JSONDecoder().decode([TagedFace].self, from: UserDefaults.standard.value(forKey: "SavedFaces") as? Data ?? Data()) {
            return decodedLocations
        }
        return tagedFaces
    }
}

