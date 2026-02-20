//
//  CounterModel.swift
//  CloudCounter
//
//  Created by Ms.Nattaporn Wilaisil on 20/2/2569 BE.
//

import SwiftUI
import Combine

final class CounterModel: ObservableObject {

    @Published private(set) var value: Int = 0

    func increment() { value += 1 }
    func decrement() { value -= 1 }
    func reset() { value = 0 }

    // MARK: - Tier

    var tier: Int {
        switch value {
        case ...0: return 0
        case 1...3: return 1
        case 4...6: return 2
        case 7...9: return 3
        case 10...12: return 4
        case 13...15: return 5
        case 16...20: return 6
        default: return 7
        }
    }

    // MARK: - Status

    var bankStatus: String {
        switch tier {
        case 0: return "😭 Don’t ask"
        case 1: return "🪙 Coins only"
        case 2: return "🍜 Instant noodle era"
        case 3: return "🛒 Window shopping pro"
        case 4: return "😌 Stable for now"
        case 5: return "💰 Rich for 3 minutes"
        case 6: return "🤑 Financial freedom"
        default: return "👑 TOO RICH — NO MORE LEVELS"
        }
    }

    // MARK: - Description (✨ FIXED BACK)

    var descriptionText: String {
        switch tier {
        case 0: return "It’s okay. Every tap is a step toward your comeback."
        case 1: return "Small coins today, big dreams tomorrow."
        case 2: return "Budget mode activated — and you’re doing great."
        case 3: return "Browsing like a billionaire in training."
        case 4: return "You’ve got stability. That’s powerful."
        case 5: return "Rich energy unlocked — keep going!"
        case 6: return "Welcome to your financial freedom era."
        default: return "You won the money game. Nothing can stop you now."
        }
    }

    // MARK: - Background

    var backgroundGradient: LinearGradient {

        switch tier {

        case 0:
            return LinearGradient(colors: [.black, .gray], startPoint: .top, endPoint: .bottom)

        case 1:
            return LinearGradient(colors: [.gray, .blue], startPoint: .top, endPoint: .bottom)

        case 2:
            return LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)

        case 3:
            return LinearGradient(colors: [.purple, .pink], startPoint: .top, endPoint: .bottom)

        case 4:
            return LinearGradient(colors: [.pink, .orange], startPoint: .top, endPoint: .bottom)

        case 5:
            return LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom)

        case 6:
            return LinearGradient(colors: [.yellow, .mint], startPoint: .top, endPoint: .bottom)

        default:
            return LinearGradient(colors: [.mint, .cyan, .white],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
        }
    }
}
