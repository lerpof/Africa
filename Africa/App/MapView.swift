//
//  MapView.swift
//  Africa
//
//  Created by Leonardo Lazzari on 27/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLoaction] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK: - Basic Map
//        Map(coordinateRegion: $region)
        
        // MARK: - Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) PIN: OLD STILE (STATIC)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STILE (STATIC)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (INTERACTIVE)
            // MapAnnotation(coordinate: item.location) {
            //     Image("logo")
            //         .resizable()
            //         .scaledToFit()
            //         .frame(width: 32, height: 32, alignment: .center)
            // } //: ANNOTATION
            
            // (D) CUSTOM ADVANCED ANNOTATION (INTERACTIVE)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            } //: ANNOTATION
        } //: MAP
        .overlay(alignment: .top) {
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
        }
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
