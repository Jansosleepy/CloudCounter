//
//  EmojiBurstView.swift
//  CloudCounter
//
//  Created by Ms.Nattaporn Wilaisil on 20/2/2569 BE.
//

import SwiftUI

struct EmojiBurstView: View {

    @State private var animate = false

    let emojis = ["💸","💰","✨","🪙","🌟","🏦"]

    var body: some View {

        GeometryReader { geo in

            ZStack {

                ForEach(0..<30, id: \.self) { _ in

                    Text(emojis.randomElement()!)
                        .font(.system(size: 24))
                        .position(
                            x: CGFloat.random(in: 40...geo.size.width - 40),
                            y: animate ? -50 : geo.size.height + 50
                        )
                        .opacity(animate ? 0 : 1)
                        .animation(
                            .easeOut(duration: Double.random(in: 1.2...2)),
                            value: animate
                        )
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            animate = true
        }
    }
}
