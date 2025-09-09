//
//  IndividualGameView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 26/6/2024.
//
//Color(red: 0.0, green: 1.0, blue: 1.0)

import SwiftUI

struct IndividualGameView: View {
    let question: Question
    let confirmed: Bool
    @State private var selection = "default"
    var body: some View {
        VStack{
            Text(question.questionTitle)
            ForEach(question.choices, id:\.self){ choice in
                Button {    
                    if(confirmed==false){
                        selection = choice
                    }
                } label: {
                            Text(choice)
                                .padding()
                                //.background((confirmed == true && selection == choice) ? (selection == question.answer ? Color.green : Color.red) : Color.white)
                                .cornerRadius(15)
                                .frame(height: 75)
                                .background(Rectangle()
                                    .foregroundColor((confirmed == true && selection == choice) ? (selection == question.answer ? Color.green : Color.red) : Color.white)
                                    .cornerRadius(15)
                                    .shadow(color:  (confirmed == true ? (choice == question.answer ? Color.green : (selection == choice ? Color.red : Color.clear)) : (selection == choice ? Color.yellow : Color.black)),radius: 15))
                    }
            }
        }
    }
}

#Preview {
    NavigationView{
        IndividualGameView(question: Question(questionTitle: "What is the weather today?", choices: ["sunny", "cloudy", "rainy"], answer: "cloudy"), confirmed: false)
    }
}
