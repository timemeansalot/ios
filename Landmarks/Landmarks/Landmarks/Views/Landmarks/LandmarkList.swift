//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[Landmark]{
        modelData.landmarks.filter{landmark in
            (!showFavoritesOnly||landmark.isFavorite)
         }
    }
    var body: some View {
        // give a unique identifier to make our data type conforms to the Identifiable protocol
        //        List(landmarks,id:\.id){landmark in
        // no more need the id parameter
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks){landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark) // destination
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks") // set the title of navitation bar
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
//        ForEach(["iPhone 13 Pro Max","iPhone SE (3rd generation)"],id:\.self){deviceName in
        ForEach(["iPhone 13 Pro Max"],id:\.self){deviceName in
           LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
    // show previews for different divices
    
}
