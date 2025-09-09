//
//  RestaurantDetailedView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 22/6/2024.
//

import SwiftUI
import UIKit
import MapKit

struct locationView: View{
    var locationLink : String
    var body: some View{
        Button(action:{
            if let url = URL(string: locationLink){
                UIApplication.shared.open(url)
            }
        }){
            Image(systemName: "map")
        }
    }
}

struct RestaurantImagesView: View{
    let imageNames: [String]
    
    var body: some View{
        HStack {
            Spacer()
            ForEach(1..<imageNames.count, id: \.self) { index in
                    Image(imageNames[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                Spacer()
                }
        }
        .padding(.horizontal)
    }
}

struct RestaurantDetailedView: View {
    let restaurant: Restaurant
    var body: some View {
        NavigationView{
            VStack{
                Text(restaurant.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                HStack{
                    RestaurantImagesView(imageNames: restaurant.imageNames)
                }

                HStack{
                    VStack(alignment: .center){
                        Text("營業時間: ")
                            .font(.subheadline)
                        Text("\(restaurant.openingHours)")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.trailing)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: RestaurantView()) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "fork.knife")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView{
        RestaurantDetailedView(restaurant: Restaurant(
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
        )
            )
    }
    
}

