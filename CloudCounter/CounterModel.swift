//
//  CounterModel.swift
//  CloudCounter
//
//  Created by Ms.Nattaporn Wilaisil on 20/2/2569 BE.
//

import Foundation
import Combine
import SwiftUI

final class CounterModel: ObservableObject {

    @Published private(set) var value: Int = 0

    func increment() { value += 1 }
    func decrement() { value -= 1 }
    func reset() { value = 0 }

    // MARK: - Bank Status

    var bankStatus: String {
        switch value {
        case ...0: return "😭 Don’t ask"
        case 1...3: return "🪙 Coins only"
        case 4...6: return "🍜 Instant noodle era"
        case 7...9: return "🛒 Window shopping pro"
        case 10...12: return "😌 Stable for now"
        case 13...15: return "💰 Rich for 3 minutes"
        case 16...20: return "🤑 Financial freedom"
        default: return "👑 TOO RICH — NO MORE LEVELS"
        }
    }

    // MARK: - Story sentence

    var moneyStory: String {
        switch value {
        case ...0:
            return "Every tap is a step away from financial sadness."
        case 1...5:
            return "Your wallet is slowly waking up… keep tapping 💸"
        case 6...10:
            return "Confidence and bank balance rising together 😌"
        case 11...15:
            return "Luxury mindset unlocked ✨"
        case 16...20:
            return "You have entered your billionaire era 🏦"
        default:
            return "Game completed. Money is now just a number."
        }
    }

    // MARK: - Gradient Background

    var backgroundGradient: LinearGradient {

        switch value {

        case ...0:
            return LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom)

        case 1...3:
            return LinearGradient(colors: [.gray, .blue], startPoint: .top, endPoint: .bottom)

        case 4...6:
            return LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)

        case 7...9:
            return LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom)

        case 10...12:
            return LinearGradient(colors: [.pink, .orange], startPoint: .top, endPoint: .bottom)

        case 13...15:
            return LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom)

        case 16...20:
            return LinearGradient(colors: [.yellow, .mint], startPoint: .top, endPoint: .bottom)

        default:
            // ⭐ FINAL ULTRA RICH MODE
            return LinearGradient(
                colors: [.mint, .cyan, .white],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}
