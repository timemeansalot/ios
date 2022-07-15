//
//  ModelData.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import Foundation
import SwiftUI

//an array of landmarks which initialized from json file
var landmarks: [Landmark] = load("landmarkData.json")


// load data from json file with a given name
func load<T: Decodable>(_ filename: String)->T{
    let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
}
