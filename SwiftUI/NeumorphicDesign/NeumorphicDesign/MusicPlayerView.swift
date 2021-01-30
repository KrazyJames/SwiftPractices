//
//  MusicPlayerView.swift
//  NeumorphicDesign
//
//  Created by Jaime Escobar on 29/01/21.
//

import SwiftUI

struct MusicPlayerView: View {
    @State private var progress: Double = 0.0
    @State private var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .ignoresSafeArea()
            VStack {
                HStack {
                    NeumorphicImageButton(systemName: "arrow.left", size: CGSize(width: 20, height: 20)) {
                    }.foregroundColor(.black)
                    Spacer()
                    Text("Now Playing").font(.title).foregroundColor(.black)
                    Spacer()
                    NeumorphicImageButton(systemName: "list.bullet", size: CGSize(width: 20, height: 20)) {
                    }.foregroundColor(.black)
                }
                Spacer()
                ZStack {
                    Image("image")
                        .frame(width: 300, height: 300)
                        .clipShape(Circle()).padding()
                        .shadow(color: .gray, radius: 10, x: 10, y: 10)
                        .shadow(color: .white, radius: 10, x: -10, y: -10)
                }.clipShape(Circle())
                Text("Blinding Lights").font(.title2).foregroundColor(.black)
                Text("The Weeknd").font(.title3).foregroundColor(.black)
                Slider(value: $progress)
                    .accentColor(.black)
                    .shadow(color: .gray, radius: 10, x: 10, y: 10)
                    .shadow(color: .white, radius: 10, x: -10, y: -10)
                Spacer()
                HStack(spacing: 30) {
                    NeumorphicImageButton(systemName: "backward.fill", size: CGSize(width: 20, height: 20)) {
                    }.foregroundColor(.black)
                    NeumorphicImageButton(systemName: isPlaying ? "pause.fill" : "play.fill", size: CGSize(width: 20, height: 20)) {
                        isPlaying.toggle()
                    }.foregroundColor(.black)
                    NeumorphicImageButton(systemName: "forward.fill", size: CGSize(width: 20, height: 20)) {
                    }.foregroundColor(.black)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
