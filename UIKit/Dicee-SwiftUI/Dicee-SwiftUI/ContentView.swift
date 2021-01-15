//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Jaime Escobar on 28/04/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var LN: Int = 1
    @State var RN: Int = 1
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.vertical)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack{
                    DiceView(n: LN)
                    DiceView(n: RN)
                }
                Spacer()
                Button(action:{
                    self.LN = Int.random(in: 1...6)
                    self.RN = Int.random(in: 1...6)
                }){
                    Text("Roll")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                }
                .buttonStyle(PlainButtonStyle())
                .background(Color.red)
            }.padding()
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View{
        Image("dice\(n)").resizable().aspectRatio(contentMode: .fit).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
