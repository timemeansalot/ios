//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // give a unique identifier to make our data type conforms to the Identifiable protocol
        //        List(landmarks,id:\.id){landmark in
        // no more need the id parameter
        NavigationView{
            List(landmarks){landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark) // destination
                }label: {
                    LandmarkRow(landmark: landmark)
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
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
    // show previews for different divices
    
}
