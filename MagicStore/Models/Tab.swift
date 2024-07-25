//
//  Tab.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 11/13/23.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case search
    case myCards
    
    private var title: String {
        switch self {
        case .search: "Card Search"
        case .myCards: "My Cards"
        }
    }
    
    private var icon: String {
        switch self {
        case .search: "magnifyingglass"
        case .myCards: "star.fill"
        }
    }
}

// MARK: Identifiable

extension Tab: Identifiable {
    var id: Int {
        rawValue
    }
}

// MARK: View Builders

extension Tab {
    var tabItem: some View {
        VStack {
            Image(systemName: icon)
            Text(title)
        }
    }
    
    var rootView: some View {
        Group {
            switch self {
            case .search:
                CardSearchView(viewModel: .init())
            case .myCards:
                MyCardsView()
            }
        }
        .navigationTitle(title)
    }
}
