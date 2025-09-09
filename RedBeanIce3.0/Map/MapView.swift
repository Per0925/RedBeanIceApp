//
// MapView.swift
// RedBeanIce3.0
//
// Created by Percy Cheung on 30/7/2024.
//

import SwiftUI
import MapKit

func createMapRegion(from restaurants: [Restaurant]) -> MKCoordinateRegion? {
    guard !restaurants.isEmpty else { return nil }

    let totalLatitude = restaurants.reduce(0.0) { $0 + $1.coordinates.latitude }
    let totalLongitude = restaurants.reduce(0.0) { $0 + $1.coordinates.longitude }

    let averageLatitude = totalLatitude / Double(restaurants.count)
    let averageLongitude = totalLongitude / Double(restaurants.count)
    //print(averageLatitude, averageLongitude)

    return MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: averageLatitude, longitude: averageLongitude),
        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
    )
}

struct MapView: View {
    @State private var mapRestaurants: [Restaurant] = Restaurants
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.346899, longitude: 114.118812),
        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
    )
    @State var selectedRestaurant: Restaurant?
    @State var isTapped = false
    @State private var navigateToDetail = false
    //@State private var isLoading = true
    var body: some View {
        NavigationView {
            ZStack {
                    Map(
                        coordinateRegion: $mapRegion,
                        interactionModes: .all,
                        showsUserLocation: true,
                        annotationItems: mapRestaurants,
                        
                        annotationContent: { restaurant in
                            
                            MapAnnotation(coordinate: restaurant.coordinates) {

                                Button(action: {
                                    selectedRestaurant = restaurant
                                    navigateToDetail = true
                                }) {
                                    Image(systemName: "pin.fill")
                                        .foregroundColor(.red)
                                        .font(.title)
                                }
                                .background(
                                    NavigationLink(
                                        destination: selectedRestaurant.map { MapPreviewCards(restaurant: $0, fromMap: true) },
                                        isActive: $navigateToDetail
                                    ) {
                                        EmptyView()
                                    }
                                    .hidden()
                                )
                                 
                               
                            }
                            
                        }
                        
                    )
                    .ignoresSafeArea()
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        if let region = createMapRegion(from: mapRestaurants) {
                            mapRegion = region
                        }else{
                            print("waiting")
                        }
                    }
                    
                }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if !navigateToDetail{
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "house")
                    }
                }
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
