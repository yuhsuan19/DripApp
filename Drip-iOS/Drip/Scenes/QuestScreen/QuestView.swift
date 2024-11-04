//
//  QuestView.swift
//  Drip
//
//  Created by Shane Chi on 2024/11/2.
//

import SwiftUI
import CoreGraphics

struct QuestView: View {
    @State private var timeRemaining: CGFloat = 10.0
    let totalTime: CGFloat = 10.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()


    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                Text("Question 5 / 10")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 36, weight: .heavy))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(DripColor.darkSub)
                Spacer().frame(width: 16)
                Image(.clock)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("\(String(format: "%.1f", timeRemaining)) s")
                    .frame(width: 55)
                    .foregroundStyle(DripColor.main)
            }
            Spacer().frame(height: 10)
            HStack {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width)
                            .foregroundColor(DripColor.main)
                        Rectangle()
                            .frame(width: (1 - (timeRemaining / totalTime)) * geometry.size.width)
                            .foregroundColor(DripColor.lightSub)
                            .animation(.linear(duration: 1), value: timeRemaining)
                    }
                }.frame(height: 5)
                Spacer()
            }
            Spacer().frame(height: 30)
            Text(sampleQuestion())
                .font(.system(size: 32))
                .frame(alignment: .top)
                .minimumScaleFactor(0.5)
                .fixedSize(horizontal: false, vertical: false)
                .frame(maxHeight: 200)
                .padding(.horizontal, 20)
            Spacer().frame(height: 30)
            VStack(spacing: 24) {
                StokeButton(title: "地窖、地下室")
                StokeButton(title: "原因、起因")
                StokeButton(title: "大災難")
                StokeButton(title: "家務雜物")
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DripColor.backgroundGrey.ignoresSafeArea())
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 0.1
            }
        }
    }

    func sampleQuestion() -> AttributedString {
        let sentence = "The earthquake was a terrible catastrophe."
        let word = "catastrophe"

        let textColor = UIColor(red: 80/255, green: 87/255, blue: 142/255, alpha: 1)

        let range = (sentence.lowercased() as NSString).range(of: word.lowercased())
        let mutableAttributedString = NSMutableAttributedString.init(string: sentence)
        mutableAttributedString.addAttribute(.foregroundColor, value: textColor, range: NSRange(location: 0, length: sentence.count))
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor(red: 57/255, green: 162/255, blue: 219/255, alpha: 1), range: range)

        return AttributedString(mutableAttributedString)
    }
}

#Preview {
    VStack {
        QuestView()
    }
    .padding(.horizontal, 24)
    .padding(.top, 24)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(DripColor.backgroundGrey.ignoresSafeArea())
}
