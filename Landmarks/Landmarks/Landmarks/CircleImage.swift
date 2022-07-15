//
//  CircleImage.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())//change the image view from square to circle
            .overlay{Circle().stroke(.gray,lineWidth: 4)} // add a line on the border of the circle image
            .shadow(radius: 7) // add shadow
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
