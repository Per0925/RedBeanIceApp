//
//  FeedCell.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 30/6/2024.
//

import SwiftUI
import AVKit


struct FeedCell: View {
    let reel: Reel
    var player: AVPlayer
    
    init(reel: Reel, player: AVPlayer){
        self.reel = reel
        self.player = player
    }
    
    var body: some View {
        ZStack{
            CustomVideoPlayer(player: player)
            //1:25:42
                .containerRelativeFrame([.horizontal, .vertical])

            VStack{
                Spacer()
                
                HStack{
                    VStack(alignment: .leading){
                        Text(reel.author)
                            .fontWeight(.semibold)
                            
                        Text(reel.title)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
            }
        }
        .onDisappear {
                    player.pause()
        }
        .onTapGesture{
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    
    FeedCell(reel: Reel(videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", title: "test video 1", author: "cct_percy"), player: AVPlayer())
    
}
