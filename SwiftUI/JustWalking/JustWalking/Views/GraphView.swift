//
//  GraphView.swift
//  JustWalking
//
//  Created by Jaime Escobar on 14/01/21.
//

import SwiftUI

struct GraphView: View {
    var list: [StepsInfo] {
        didSet {
            total = list.map{$0.count}.reduce(0,+)
        }
    }
    
    @AppStorage("stepCount", store: UserDefaults(suiteName: "group.com.kj.JustWalking"))
    private var total: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Text("Total steps from past week: \(total)").font(.headline)
            HStack(alignment: .lastTextBaseline) {
                ForEach(list, id: \.id) { step in
                    let y = Swift.min(step.count/20, 300)
                    VStack {
                        Text("\(step.count)")
                        Rectangle()
                            .fill(step.count > 5000 ? Color.green : Color.red)
                            .frame(width: 20, height: CGFloat(y))
                        Text(step.date.getString(with: "E d"))
                        Text(step.date.getString(with: "MMM"))
                    }
                }
            }
            Spacer()
            Text("The goal is 5000 steps per day in order to stay healthy").font(.subheadline).opacity(0.75)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(list: [
            StepsInfo(count: 1111, date: Date()),
            StepsInfo(count: 3333, date: Date()),
            StepsInfo(count: 4444, date: Date()),
            StepsInfo(count: 12087, date: Date())
        ])
    }
}

extension Date {
    func getString(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
