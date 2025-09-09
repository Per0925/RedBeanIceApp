//
//  GameView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 22/6/2024.
//

import SwiftUI


struct Question: Identifiable{
    let questionTitle: String
    let choices: [String]
    let answer: String
    @State var selection: String?
    var id: String{
        questionTitle+choices[0]
    }
}

class QuestionManager: ObservableObject{
    var questionList = [
        Question(questionTitle: "紅豆冰初期淨係係邊度有得賣？", choices: ["茶餐廳", "冰室", "西式餐廳", "大牌檔"], answer: "冰室"),
        Question(questionTitle: "以下邊個唔係刨冰紅豆冰沒落既原因？", choices: ["大眾認為使用刨冰的紅豆冰不衛生", "出現製冰機製造冰塊", "刨冰成本過高", "以上皆是"], answer: "刨冰成本過高"),
        Question(questionTitle: "以下邊個係香港唯一提供刨冰紅豆冰既地方？", choices: ["萬芳冰室", "廣成冰室", "金華冰室", "和can"], answer: "廣成冰室"),
        Question(questionTitle: "傳統紅豆冰從頭製作需時幾耐？", choices: ["十分鐘", "一小時", "一天", "兩天"], answer: "兩天"),
        Question(questionTitle: "以下那一項係紅豆冰獨特性既體現？", choices: ["具有冰室既文化價值", "象徵香港人消暑既需要", "體現中西合壁", "以上皆是"], answer: "以上皆是")
    ]
}


struct GameTextView: View{
    let title: String
    let description: String
    var body: some View{
        VStack{
            TitleView(titleText: title)
            Spacer()
            VStack(alignment: .leading) {
                // Split the description by new lines
                let lines = description.split(separator: "\n").map(String.init)
                
                ForEach(lines, id: \.self) { line in
                    Text(line)
                        .foregroundStyle(.black)
                        .padding(5) // Optional padding between lines
                }
            }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
            Spacer()
        }
    }
}

struct GameButtonView: View{
    @State var currentQuestionIndex = 0
    @StateObject var manager = QuestionManager()
    var body: some View{
        NavigationLink(destination: GameDetailedView(questionManager: manager), label: {
            GameButtonOutlookView(showingText: "立即開始！")
        })
    }
}

struct ReturnHomeButtonView: View{
    var body: some View{
        NavigationLink(destination: HomeView(), label: {
            GameButtonOutlookView(showingText: "回到主頁")
        })
    }
}

struct GameView: View {
    var body: some View {
        VStack{
            GameTextView(title: "紅豆冰小遊戲", description: "挑戰紅豆冰冷知識")
            Spacer()
            HStack{
                GameButtonView()
                ReturnHomeButtonView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView{
        GameView()
    }
}
