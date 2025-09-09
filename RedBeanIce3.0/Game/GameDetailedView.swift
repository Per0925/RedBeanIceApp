//
//  GameDetailedView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 24/6/2024.
//

import SwiftUI

struct GameButtonOutlookView: View{
    let showingText: String
    var body: some View{
        Text(showingText)
        .padding()
        .background(.blue)
        .foregroundColor(.white)
        .font(.headline)
        .cornerRadius(15)
    }
}

struct GameDetailedView: View {
    @State var questionManager: QuestionManager
    @State var currentQuestionIndex = 0
    @State var confirmed = false
    @State var finished = false
    var body: some View {
        VStack{
            IndividualGameView(question: questionManager.questionList[currentQuestionIndex], confirmed: confirmed)
            HStack{
                Button(action: {
                    confirmed = true
                }, label: {
                    GameButtonOutlookView(showingText: "確認")
                })
                
                if(finished){
                    if(confirmed){
                        NavigationLink(destination: SummaryView(), label:{
                            GameButtonOutlookView(showingText: "完成！")
                        })
                    }else{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            GameButtonOutlookView(showingText: "完成！")
                        })
                    }
                    
                }else{
                    Button(action: {
                        if(confirmed==true){
                            confirmed = false
                            currentQuestionIndex = (currentQuestionIndex+1)%questionManager.questionList.count
                            if(currentQuestionIndex==(questionManager.questionList.count-1)){
                                finished = true
                            }
                            print(currentQuestionIndex)
                        }
                        }, label: {
                            GameButtonOutlookView(showingText: "下一題")
                    })
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: GameView()) {
                    Image(systemName: "chevron.left")
                    Image(systemName: "gamecontroller")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
    
#Preview {
    NavigationView{
        GameDetailedView(questionManager: QuestionManager())
    }
}
    

