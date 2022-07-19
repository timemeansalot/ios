//
//  FavoriteBotton.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI

struct FavoriteBotton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button{
            isSet.toggle() // action of Button when click: change true to false or change false to true.
        }label: {
            // apperance of Button
            Label("Toggle Favorite",systemImage: isSet ? "star.fill":"star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow:.gray)
        }
    }
}

struct FavoriteBotton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBotton(isSet: .constant(true))
    }
}
