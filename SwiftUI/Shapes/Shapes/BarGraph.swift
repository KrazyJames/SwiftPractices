//
//  BarGraph.swift
//  Shapes
//
//  Created by Jaime Escobar on 14/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct BarGraph: View {
    let reports: [Report]
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                ForEach(self.reports, id: \.year) { report in
                    BarView(report: report)
                }
            }
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph(reports: Report.all())
    }
}

struct BarView: View {
    let report: Report
    @State var showBar: Bool = false
    var body: some View {
        let value = report.revenue / 5000
        let yValue = Swift.min(value * 20, 5000)
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return VStack {
            Text(currencyFormatter.string(from: NSNumber(value: report.revenue)) ?? "$0")
            Rectangle().fill(Color.red).frame(width: 100, height: self.showBar ? CGFloat(yValue) : 0).onAppear() {
                withAnimation(.spring()) {
                    self.showBar = true
                }
            }
            Text(report.year)
        }
    }
}

