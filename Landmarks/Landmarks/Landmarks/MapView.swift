//
//  MapView.swift
//  Landmarks
//
//  Created by 付杰 on 2022/7/15.
//

import SwiftUI
import MapKit // for map related stuff

struct MapView: View {
    // the @State makes the variable changable and Swift UI will render the UI whenever the variable changes
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
   )
    
    
    
    var body: some View {
        Map(coordinateRegion: $region)// create a map, the $region get the value of region. Use *live preview* we can see the map in the preview window
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
