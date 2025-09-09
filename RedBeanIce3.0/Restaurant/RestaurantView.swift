//
//  RestaurantView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 22/6/2024.
//

import SwiftUI
import MapKit

struct Restaurant: Hashable, Identifiable{
    
    let imageNames: [String]
    let title: String
    let star: Double
    let price: String
    let priceInt: Int
    let redBeanIcePrice: String
    let redBeanIcePriceInt: Int
    let openingHours: String
    let coordinates: CLLocationCoordinate2D
    let address: String
    let food: Double
    let environment: Double
    let location: Double
    let service: Double
    
    var id: String{
        title + imageNames[0]
    }
    
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
            return lhs.title == rhs.title &&
                   lhs.imageNames == rhs.imageNames &&
                   lhs.star == rhs.star &&
                   lhs.price == rhs.price &&
                   lhs.priceInt == rhs.priceInt &&
                   lhs.redBeanIcePrice == rhs.redBeanIcePrice &&
                   lhs.redBeanIcePriceInt == rhs.redBeanIcePriceInt &&
                   lhs.openingHours == rhs.openingHours &&
                   lhs.coordinates.latitude == rhs.coordinates.latitude &&
                   lhs.coordinates.longitude == rhs.coordinates.longitude &&
        lhs.address == rhs.address &&
        lhs.food == rhs.food &&
        lhs.environment == rhs.environment &&
        lhs.location == rhs.location &&
        lhs.service == rhs.service
                    
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(title)
            hasher.combine(imageNames)
            hasher.combine(star)
            hasher.combine(price)
            hasher.combine(priceInt)
            hasher.combine(redBeanIcePrice)
            hasher.combine(redBeanIcePriceInt)
            hasher.combine(openingHours)
            hasher.combine(coordinates.latitude)
            hasher.combine(coordinates.longitude)
            hasher.combine(address)
            hasher.combine(food)
            hasher.combine(environment)
            hasher.combine(location)
            hasher.combine(service)
            
        }
}

let Restaurants: [Restaurant] = [
    Restaurant(
        imageNames: ["manfong", "manfong_food_1", "manfong_food_2"],
        title: "萬芳冰室",
        star: 4.0,
        price: "$0-50",
        priceInt: 0,
        redBeanIcePrice: "$10-20",
        redBeanIcePriceInt: 10,
        openingHours: "7:15am–9:30pm",
        coordinates: CLLocationCoordinate2D(latitude: 22.44186, longitude: 114.03137),
        address: "元朗建德街35-55號時景花園地下10號舖",
        food: 4.0,
        environment: 4.5,
        location: 3.0,
        service: 4.0
    ),
    Restaurant(
        imageNames: ["woocan", "woocan_food_1", "woocan_food_2"],
        title: "和 Can",
        star: 3.0,
        price: "$0-50",
        priceInt: 0,
        redBeanIcePrice: "$0-10",
        redBeanIcePriceInt: 0,
        openingHours: "週一至五 8:30am-8:30pm, 週六 11am-8pm, 週日及假期休息",
        coordinates: CLLocationCoordinate2D(latitude: 22.42780, longitude: 114.20397),
        address: "沙田香港中文大學和聲書院低層二樓",
        food: 4.0,
        environment: 5.0,
        location: 2.0,
        service: 5.0
    ),
    Restaurant(
        imageNames: ["kamwa", "kamwa_food_1", "kamwa_food_2"],
        title: "金華冰室",
        star: 3.5,
        price: "$50-100",
        priceInt: 50,
        redBeanIcePrice: "$20-30",
        redBeanIcePriceInt: 20,
        openingHours: "6:30am–9pm",
        coordinates: CLLocationCoordinate2D(latitude: 22.32293, longitude: 114.16998),
        address: "太子弼街47號地舖",
        food: 3.5,
        environment: 4.0,
        location: 5.0,
        service: 3.0
    ),
    Restaurant(
        imageNames: ["alun", "alun_food_1", "alun_food_2"],
        title: "本記阿倫冰室",
        star: 3.0,
        price: "$0-50",
        priceInt: 0,
        redBeanIcePrice: "$10-20",
        redBeanIcePriceInt: 10,
        openingHours: "7am-5pm,週三休息",
        coordinates: CLLocationCoordinate2D(latitude: 22.21135, longitude: 114.02802),
        address: "長洲海傍街39號地舖",
        food: 4.0,
        environment: 2.0,
        location: 4.0,
        service: 5.0
    ),
    Restaurant(
        imageNames: ["kinkei", "kinkei_food_1", "kinkei_food_2"],
        title: "新香園（堅記）",
        star: 4.0,
        price: "$0-50",
        priceInt: 0,
        redBeanIcePrice: "$10-20",
        redBeanIcePriceInt: 10,
        openingHours: "6:30am-6pm",
        coordinates: CLLocationCoordinate2D(latitude: 22.33056, longitude: 114.16072),
        address: "深水埗桂林街38A號地舖",
        food: 4.5,
        environment: 3.0,
        location: 4.5,
        service: 3.5
    )
]

var rankedRestaurants: [Restaurant] = []

struct SortingButton: Identifiable{
    let title: String
    let smallest: String
    let largest: String
    
    var id: String{
        title + smallest
    }
}

let SortingButtons: [SortingButton] = [
    SortingButton(title: "評分", smallest: "最低", largest: "最高"),
    SortingButton(title: "價錢", smallest: "最低", largest: "最高"),
    SortingButton(title: "紅豆冰價錢", smallest: "最低", largest: "最高"),
    //SortingButton(title: "位置", smallest: "最近", largest: "最遠"),
    
]

struct individualSortingButtonAppearance: View{
    let title: String
    var body: some View{
        Text(title)
            .padding(15)
            .background(.gray)
            .foregroundColor(.white)
            .font(.footnote)
            .cornerRadius(5)
    }
}

func sortFunc(sortedRestaurants: [Restaurant], smaller: Bool, compare: String) -> [Restaurant]{
    if (smaller){
        switch(compare){
        case "評分":
            return sortedRestaurants.sorted(by: {
                $0.star < $1.star
            })
        case "價錢":
            return sortedRestaurants.sorted(by: {
                $0.priceInt < $1.priceInt
            })
        case "紅豆冰價錢":
            return sortedRestaurants.sorted(by: {
                $0.redBeanIcePriceInt < $1.redBeanIcePriceInt
            })
        default:
            return sortedRestaurants
        }
        

    }else{
        switch(compare){
        case "評分":
            return sortedRestaurants.sorted(by: {
                $0.star > $1.star
            })
        case "價錢":
            return sortedRestaurants.sorted(by: {
                $0.priceInt > $1.priceInt
            })
        case "紅豆冰價錢":
            return sortedRestaurants.sorted(by: {
                $0.redBeanIcePriceInt > $1.redBeanIcePriceInt
            })
        default:
            return sortedRestaurants
        }
    }
}

/*
func sortFunc<T: Comparable>(restaurants: [Restaurant], smaller: Bool, keyPath: KeyPath<Restaurant, T>) -> [Restaurant] {
    if smaller {
        return restaurants.sorted(by: { $0[keyPath: keyPath] < $1[keyPath: keyPath] })
    } else {
        return restaurants.sorted(by: { $0[keyPath: keyPath] > $1[keyPath: keyPath] })
    }
}
 */


struct individualSortingButtonView: View{
    var sortingButton: SortingButton
    @Binding var restaurants: [Restaurant]
    @Binding var sortedRestaurants: [Restaurant]
    @State var smallerPressed = false
    @State var largerPressed = false
    var body: some View{
        Menu{
            Button{
                //sortingButton.pressed = true
                smallerPressed = !smallerPressed
                largerPressed = false
                sortedRestaurants=sortFunc(sortedRestaurants: sortedRestaurants, smaller: true, compare: sortingButton.title)
            } label: {
                Text(sortingButton.smallest)
                if(smallerPressed){
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
            Button{
                largerPressed = !largerPressed
                smallerPressed = false
                sortedRestaurants=sortFunc(sortedRestaurants: sortedRestaurants, smaller: false, compare: sortingButton.title)
            } label: {
                Text(sortingButton.largest)
                if(largerPressed){
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        } label: {
            if(smallerPressed || largerPressed){
                individualSortingButtonAppearance(title: sortingButton.title)
                    .shadow(color: Color.orange, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }else{
                individualSortingButtonAppearance(title: sortingButton.title)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

struct SortingButtonsView: View{
    @Binding var restaurants: [Restaurant]
    @Binding var sortedRestaurants: [Restaurant]
    var body: some View{
        HStack{
            ForEach(SortingButtons) { sortingButton in
                individualSortingButtonView(sortingButton: sortingButton, restaurants: $restaurants, sortedRestaurants: $sortedRestaurants)
            }
        }
    }
    
}

struct StarView: View{
    var star: Double
    //HStack{
    var body: some View{
        HStack{
            ForEach(0..<Int(star)){_ in
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                    .font(.title)
            }
            if star.truncatingRemainder(dividingBy: 1) > 0{
                Image(systemName: "star.leadinghalf.fill")
                    .foregroundColor(.orange)
                    .font(.title)
            }
        
        }
    }
    
}

struct RestaurantButton: View{
    @State var restaurant: Restaurant
    var body: some View{
        VStack{
            Image(restaurant.imageNames[0])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .cornerRadius(8)
                .shadow(radius: 4)
            HStack{
                VStack(alignment: .leading){
                    Text(restaurant.title)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    StarView(star: restaurant.star)
                }
                Spacer()
                VStack(alignment: .center){
                    Text("人均價錢:")
                    Text("\(restaurant.price)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("紅豆冰價錢:")
                    Text("\(restaurant.redBeanIcePrice)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

func GetFilteredRestaurants(sortedRestaurants: [Restaurant], searchText: String)-> [Restaurant]{
    
    //@Binding var searchText: String
    print("hello")
    var sortedRestaurants : [Restaurant] {
        if searchText.isEmpty{
            sortedRestaurants
        }else{
            sortedRestaurants.filter{
                $0.title.localizedStandardContains(searchText)
            }
        }
    }
    return sortedRestaurants
}

struct SearchBarView: View{
    //@State private var searchText = ""
    @Binding var searchText: String
    var body: some View{
        TextField("Please enter restaurant", text: $searchText)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.name)
    }
    
    func getFilteredRestaurants() -> [Restaurant]{
        return searchText.isEmpty ? Restaurants : Restaurants.filter { $0.title.localizedStandardContains(searchText) }
    }
    
}

struct RestaurantView: View {
    @State var searchText = ""
    @State var restaurants: [Restaurant] = Restaurants
    @State var sortedRestaurants: [Restaurant] = Restaurants

    //@State private var sortedRestaurants: [Restaurant] = GetFilteredRestaurants(sortedRestaurants: Restaurants, searchText: searchText)
    var body: some View {
        NavigationView{
            VStack{
                TitleView(titleText: "紅豆冰搜尋器")
                SearchBarView(searchText: $searchText)
                
                SortingButtonsView(restaurants: $restaurants, sortedRestaurants: $sortedRestaurants)
                
                List(sortedRestaurants, id: \.self){ restaurant in
                    NavigationLink(destination:  //RestaurantDetailedView
                        MapPreviewCards(restaurant: restaurant, fromMap: false)){
                        RestaurantButton(restaurant: restaurant)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "house")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: searchText) { _ in
                    restaurants = SearchBarView(searchText: $searchText).getFilteredRestaurants()
                    sortedRestaurants = restaurants
                }
    }
}

#Preview {
    NavigationView{
        VStack{
            RestaurantView()
        }
    }
}

