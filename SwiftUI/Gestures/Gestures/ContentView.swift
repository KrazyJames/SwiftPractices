//
//  ContentView.swift
//  Gestures
//
//  Created by Jaime Escobar on 14/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var dragState = CGSize.zero
    @State var tapped: Bool = false
    @State var scale: CGFloat = 1.0
    @State var angle: Double = 0
    var body: some View {
        VStack {
            Image("meme")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(12)
                .scaleEffect(self.scale)
                .gesture(MagnificationGesture()
                    .onChanged({ value in
                        self.scale = value
                    })
                    .onEnded({ _ in
                        self.scale = 1.0
                    })
                )
                
            Text("Hemllo, World!")
                .font(.largeTitle)
                
        }.frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center).background(self.tapped ? Color.red : Color.yellow).onTapGesture {
            self.tapped.toggle()
        }
        .edgesIgnoringSafeArea(.all)
        .offset(x: self.dragState.width, y: self.dragState.height)
        .gesture(DragGesture()
            .onChanged({ value in
                self.dragState = value.translation
            })
            .onEnded({ value in
                self.dragState = CGSize.zero
            })
        )
        .rotationEffect(Angle(degrees: angle))
        .gesture(RotationGesture()
            .onChanged({ angle in
                self.angle = angle.degrees
            })
            .onEnded({ _ in
                self.angle = 0
            })
        )
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
