//
//  Landmark.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//
// This is not the UI file, this is the model file

import Foundation
import SwiftUI
import CoreLocation

// Codable makes it's easier to convert data between struct and file, Hashable is used for compare objects
struct Landmark: Hashable, Codable, Identifiable{
    var id: Int // already has the property required by the Identifiable protocol
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName:String
    var image: Image{
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    // nested struct
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
