//
//  FancyScoreView.swift
//  ObservableTimer
//
//  Created by Jaime Escobar on 07/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct FancyScoreView: View {
    @EnvironmentObject var timer: FancyTimer
    var body: some View {
        VStack {
            Text("\(self.timer.value)")
                .padding()
            Button("Increment") {
                self.timer.value += 1
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.black)
        }
        .padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView().environmentObject(FancyTimer())
    }
}
