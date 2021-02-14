//
//  ContentView.swift
//  ISay
//
//  Created by 叶风 on 2021/2/13.
//

import SwiftUI


func currentTime() -> String {

    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY年MM月dd日 HH:mm:ss"
    dateFormatter.string(from: date)
    dateFormatter.locale = Locale(identifier: "zh_CN")
    dateFormatter.calendar = Calendar(identifier: .chinese)
    dateFormatter.dateStyle = .medium
    dateFormatter.shortMonthSymbols = ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
    dateFormatter.dateFormat = "U年MMMd EEE a"
    return dateFormatter.string(from: date) // 丁酉年十一月三十 週二 下午

}

struct ContentView: View {
    @State private var fullText: String = ""
    var body: some View {
        ScrollView{
            LazyVStack{
                Text(currentTime())
                    .font(Font.custom("Weibei SC", size: 16))
                Text("━━━━━━━━━━━━━━━━━━━━")
                TextEditor(text: $fullText)
                    .font(Font.custom("Weibei SC", size: 16))
                
            }
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
        .navigationTitle("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PriButton: PrimitiveButtonStyle {
    typealias Body = Button
    func makeBody(configuration: Configuration) -> some View {
        configuration.trigger()
          return
            Button(configuration)
            .background(Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

