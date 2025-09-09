//
//  MapPreviewCards.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 10/8/2024.
//

import SwiftUI
import MapKit

struct MapPreviewCards: View {
    
    let restaurant: Restaurant
    var fromMap: Bool
    
    var body: some View {
        //NavigationView{
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    infoSection
                }
                .cornerRadius(10)
                foodImageSection
                ratingSection
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
            )
        //}
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if fromMap {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: MapView()) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "map.fill")
                    }
                }
            }else{
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: RestaurantView()) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "fork.knife")
                    }
                }
            }

        }
        
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        MapPreviewCards(restaurant: Restaurant(
            imageNames: ["kinkei", "kinkei_food_1", "kinkei_food_2"],
            title: "新香園（堅記）",
            star: 4.0,
            price: "0-50",
            priceInt: 0,
            redBeanIcePrice: "10-20",
            redBeanIcePriceInt: 10,
            openingHours: "6:30am-6pm",
            coordinates: CLLocationCoordinate2D(latitude: 22.33056, longitude: 114.16072),
            address: "深水埗桂林街38A號地舖",
            food: 4.5,
            environment: 3.0,
            location: 4.5,
            service: 3.5
        ), fromMap: true)
        .padding()
    }
}

extension MapPreviewCards{
    
    private var imageSection: some View{
        ZStack{
            if let imageName = restaurant.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height: 100)
                    .cornerRadius(10)
                
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View{
        HStack(alignment: .center, spacing: 4) {
            Text(restaurant.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            StarView(star: restaurant.star)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var infoSection: some View{
        VStack(alignment: .leading, spacing: 5){
            Spacer()
                .frame(height: 10)
            Spacer()
                .frame(height: 2)
            Text("\(restaurant.address)")
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 2)
            Text("\(restaurant.openingHours)")
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
    
    private var foodImageSection: some View{
        HStack{
            Image(restaurant.imageNames[1])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
                .shadow(radius: 4)
            Spacer()
            Image(restaurant.imageNames[2])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
                .shadow(radius: 4)
        }
    }
    
    private var ratingSection: some View{
        HStack {
            VStack{
                Text("食物： ")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("環境： ")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("位置： ")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("服務： ")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            VStack(alignment: .leading){
                StarView(star: restaurant.food)
                StarView(star: restaurant.environment)
                StarView(star: restaurant.location)
                StarView(star: restaurant.service)
            }
        }
    }
    
}
