//
//  JWWidget.swift
//  JWWidget
//
//  Created by Jaime Escobar on 14/01/21.
//

import WidgetKit
import SwiftUI

struct StepEntry: TimelineEntry {
    let date: Date = Date()
    let steps: Int
}

struct Provider: TimelineProvider {
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.kj.JustWalking"))
    var stepCount: Int = 0
    
    func placeholder(in context: Context) -> StepEntry {
        let entry = StepEntry(steps: stepCount)
        return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (StepEntry) -> Void) {
        let entry = StepEntry(steps: stepCount)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<StepEntry>) -> Void) {
        let entry = StepEntry(steps: stepCount)
        completion(Timeline(entries: [entry], policy: .never))
    }
}

struct StepView: View {
    let entry: Provider.Entry
    
    var body: some View {
        Text("\(entry.steps) steps")
    }
}

struct StepView_Preview: PreviewProvider {
    static var previews: some View {
        StepView(entry: Provider.Entry(steps: 100))
    }
}

@main
struct StepWidget: Widget {
    private let kind = "StepWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StepView(entry: entry)
        }
    }
}
