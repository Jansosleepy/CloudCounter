//
//  ContentView.swift
//  CloudCounter
//
//  Created by Ms.Nattaporn Wilaisil on 20/2/2569 BE.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var model = CounterModel()

    var body: some View {

        ZStack {

            model.backgroundGradient
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.7), value: model.value)

            VStack(spacing: 20) {

                Text("Your current bank account status?")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text("\(model.value)")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Text(model.bankStatus)
                    .font(.title3)
                    .padding()
                    .background(.white.opacity(0.9))
                    .cornerRadius(20)

                Text(model.moneyStory)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                HStack(spacing: 20) {

                    Button {
                        model.decrement()
                    } label: {
                        Image(systemName: "minus")
                            .font(.title)
                            .frame(width: 60, height: 60)
                    }
                    .buttonStyle(.borderedProminent)

                    Button {
                        model.increment()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .frame(width: 60, height: 60)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Button("Reset") {
                    model.reset()
                }
                .buttonStyle(.bordered)
                .tint(.white)
            }
            .padding()
        }
    }
}
