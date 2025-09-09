//
//  HomeView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 22/6/2024.
//

import SwiftUI
import UIKit

struct HomeItem: Identifiable{
    let title: String
    let description: String
    let imageName: String
    var id: String{
        title+imageName
    }
}

let HomeItems: [HomeItem] = [
    HomeItem(
        title: "紅豆冰搜尋器",
        description: "尋找心水紅豆冰",
        imageName: "magnifyingglass"),
    
    HomeItem(
        title: "紅豆冰地圖",
        description: "探索左近紅豆冰",
        imageName: "map"),
    
    HomeItem(
        title: "紅豆冰短視頻",
        description: "感受用戶紅豆冰體驗",
        imageName: "play.rectangle"),
    
    HomeItem(
        title: "紅豆冰小遊戲",
        description: "愉快了解紅豆冰",
        imageName: "gamecontroller"),
    
    /*
    HomeItem(
        title: "更改語言",
        description: "",
        imageName: "globe")
     */
]

struct TitleView: View{
    let titleText: String
    var body: some View{
        Text(titleText)
            .font(.largeTitle)
            .padding(.bottom, 16)
            .fontWeight(.bold)
    }
}

struct SubtitleView: View{
    let subtitleText: String
    var body: some View{
        Text(subtitleText)
            .font(.title)
            .padding(.bottom, 16)
            .fontWeight(.bold)
    }
}

struct HomeButton: View{
    
    var homeItem: HomeItem
    var body: some View{
        HStack{
            Image(systemName: homeItem.imageName)
                .font(.title)
            Spacer()
            VStack{
                Text(homeItem.title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(homeItem.description)
            }
            Spacer()
        }.padding()
            .cornerRadius(15)
    }
    
}

struct HomeView: View {
    
    let homeItems: [HomeItem] = HomeItems
    var body: some View {
        NavigationView{
            VStack{
                TitleView(titleText: "Red Bean Ice")
                SubtitleView(subtitleText:"功能列表")
                List{
                    ForEach(homeItems){ item in
                        switch (item.imageName){
                        case "magnifyingglass":
                            NavigationLink(destination: RestaurantView()){
                                    HomeButton(homeItem: item)
                            }
                        case "map":
                            NavigationLink(destination: MapView()){
                                        HomeButton(homeItem: item)
                            }
                        case "play.rectangle":
                            NavigationLink(destination: ReelsView()){
                                        HomeButton(homeItem: item)
                            }
                        case "gamecontroller":
                            NavigationLink(destination: GameView()){
                                        HomeButton(homeItem: item)
                            }
                            /*
                        case "globe":
                            NavigationLink(destination: LanguageView()){
                                        HomeButton(homeItem: item)
                            }
                             */
                        default:
                            NavigationLink(destination: HomeView()){
                                        HomeButton(homeItem: item)
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView{
        HomeView()
    }
}
