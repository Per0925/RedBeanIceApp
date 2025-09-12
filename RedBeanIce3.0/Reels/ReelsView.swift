//
//  ReelsView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 22/6/2024.
//

import SwiftUI
import AVKit

struct Reel: Identifiable, Codable{
    //let id: String
    let videoUrl: String
    let title: String
    let author: String
    
    var id: String{
        title+author
    }
    
    
}

class ReelsManager: ObservableObject{
    var reelsList = [
        Reel(videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", title: "test video 1", author: "cct_percy"),
        Reel(videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4", title: "test video 2", author: "cuhk_programmer")]
    
}

struct ReelsView: View {
    @State var reelsManager = ReelsManager()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0){
                ForEach(reelsManager.reelsList){ reel in
                    FeedCell(reel: reel, player: player)
                        .id(reel.id)
                        .onAppear{
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{player.play()}
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition){ oldValue, newValue in
            playVideoOnChangeScrollPosition(reelId: newValue)

        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: HomeView()) {
                    Image(systemName: "chevron.left")
                    Image(systemName: "house")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func playInitialVideoIfNecessary(){
        guard
            scrollPosition == nil,
            let reel = reelsManager.reelsList.first,
            player.currentItem == nil else{
                return
            }
        
        let item = AVPlayerItem(url: URL(string: reel.videoUrl)!)
        player.replaceCurrentItem(with: item)
        
    }
    
    func playVideoOnChangeScrollPosition(reelId: String?){
        guard let currentReel = reelsManager.reelsList.first(where: {$0.id == reelId}) else{
            return
        }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentReel.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)

    }
}

#Preview {
    ReelsView()
}
