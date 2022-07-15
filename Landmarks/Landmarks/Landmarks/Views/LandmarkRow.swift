//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

// PreviewProvider is a protocol
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // use group to return multiple previews, so there could be multiple views shown in the preview windows
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
