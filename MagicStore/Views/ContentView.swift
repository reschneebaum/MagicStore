//
//  ContentView.swift
//  MagicStore
//
//  Created by Rachel Schneebaum on 10/3/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    private let tabs = Tab.allCases

    var body: some View {
        TabView {
            ForEach(tabs) { tab in
                NavigationStack {
                    tab.rootView
                }
                .tabItem { tab.tabItem }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self, inMemory: true)
}
