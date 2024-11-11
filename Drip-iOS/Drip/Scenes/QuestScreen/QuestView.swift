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

    var onComplete: (() -> Void)?

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 0) {
                Text("Question 5 / 10")
                    .font(.custom("LondrinaSolid-Regular", size: 36))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                Image(.clock)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("\(String(format: "%.1f", timeRemaining)) s")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: 55)
                    .foregroundStyle(DripColor.primary500Primary)
            }
            Spacer().frame(height: 16)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width)
                        .foregroundColor(DripColor.primary500Primary)
                    Rectangle()
                        .frame(width: (1 - (timeRemaining / totalTime)) * geometry.size.width)
                        .foregroundColor(Color.init(red: 176/255, green: 220/255, blue: 255/255))
                        .animation(.linear(duration: 1), value: timeRemaining)
                }
            }
            .frame(height: 5)
            .clipShape(RoundedRectangle(cornerRadius: 2.5))

            Spacer().frame(height: 20)
            Text(sampleQuestion())
                .font(.system(size: 30, weight: .bold))
                .frame(alignment: .top)
                .minimumScaleFactor(0.5)
                .fixedSize(horizontal: false, vertical: false)
                .frame(maxHeight: 200)
            Spacer().frame(height: 20)

            VStack(spacing: 16) {
                StokeButton(title: "地窖、地下室") {
                    onComplete?()
                }
                StokeButton(title: "原因、起因") {
                    onComplete?()
                }
                StokeButton(title: "大災難") {
                    onComplete?()
                }
                StokeButton(title: "家務雜物"){
                    onComplete?()
                }
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

        let textColor = UIColor.black

        let range = (sentence.lowercased() as NSString).range(of: word.lowercased())
        let mutableAttributedString = NSMutableAttributedString.init(string: sentence)
        mutableAttributedString.addAttribute(.foregroundColor, value: textColor, range: NSRange(location: 0, length: sentence.count))
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor(red: 57/255, green: 167/255, blue: 255/255, alpha: 1), range: range)

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
