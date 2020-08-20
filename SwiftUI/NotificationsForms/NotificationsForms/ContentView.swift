//
//  ContentView.swift
//  NotificationsForms
//
//  Created by Jaime Escobar on 17/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var images = ["🗾","🎑", "🏞", "🌌", "🌇"]
    private var prevs = ["Always", "While using", "Never"]
    @State private var selectedPrevOption = 0
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("Notifcation previews will be shown whether the iPhone is locked or unlocked")) {
                    Picker(selection: $selectedPrevOption, label: Text("Show previews")) {
                        ForEach(0 ..< prevs.count) {
                            Text(self.prevs[$0])
                        }
                    }
                }
                Section(footer: Text("Choose when apps can suggest shorcuts on the lock screen")) {
                    NavigationLink(destination: Text("Suggestion")) {
                        Text("Siri Suggestions")
                    }
                }
                Section(header: Text("NOTIFICATION STYLE")) {
                    List {
                        ForEach(self.images, id: \.self) {img in
                            HStack {
                                Text(img)
                                Text("Notification")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Notifications", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().colorScheme(.dark)
        }
    }
}
