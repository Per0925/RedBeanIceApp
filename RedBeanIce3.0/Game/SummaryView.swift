//
//  SummaryView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 26/6/2024.
//

import SwiftUI

struct ReturnGameButtonView: View{
    var body: some View{
        NavigationLink(destination: GameView(), label: {
            GameButtonOutlookView(showingText: "再玩一次")
        })
    }
}

struct SummaryView: View {
    var body: some View {
        VStack{
            GameTextView(title: "挑戰完成！", description: "紅豆冰最初只係係冰室有得賣\n製冰機出現同衛生原因導致刨冰紅豆冰沒落\n廣成冰室成為香港現時唯一提供刨冰紅豆冰既地方\n從頭製作傳統紅豆冰大約需時兩日\n具有冰室文化價值、象徵港人消暑需要、同體現中西合璧，顯示到紅豆冰既獨特性")
            HStack{
                ReturnGameButtonView()
                ReturnHomeButtonView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView{
        SummaryView()
    }
}
