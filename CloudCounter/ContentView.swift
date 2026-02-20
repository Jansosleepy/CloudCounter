//
//  ContentView.swift
//  CloudCounter
//
//  Created by Ms.Nattaporn Wilaisil on 20/2/2569 BE.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var model = CounterModel()

    @State private var previousTier = 0
    @State private var showBurst = false

    var body: some View {

        ZStack {

            model.backgroundGradient
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.6), value: model.tier)

            VStack(spacing: 20) {

                Text("Your current bank account status?")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text("\(model.value)")
                    .font(.system(size: 64, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text(model.bankStatus)
                    .font(.title3)
                    .padding()
                    .background(.white.opacity(0.9))
                    .cornerRadius(20)

                // ✨ DESCRIPTION BACK
                Text(model.descriptionText)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                HStack(spacing: 20) {

                    Button {
                        model.decrement()
                        checkTierChange()
                    } label: {
                        Image(systemName: "minus")
                            .font(.title)
                            .frame(width: 60, height: 60)
                    }
                    .buttonStyle(.borderedProminent)

                    Button {
                        model.increment()
                        checkTierChange()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .frame(width: 60, height: 60)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Button("Reset") {
                    model.reset()
                    previousTier = model.tier
                }
                .buttonStyle(.bordered)
                .tint(.white)
            }
            .padding()

            // 💥 EMOJI BURST LAYER
            if showBurst {
                EmojiBurstView()
                    .transition(.opacity)
            }
        }
        .onAppear {
            previousTier = model.tier
        }
    }

    func checkTierChange() {

        if model.tier != previousTier {

            previousTier = model.tier

            showBurst = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                showBurst = false
            }

            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
    }
}
