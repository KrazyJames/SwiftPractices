//
//  ContentView.swift
//  Shared
//
//  Created by Jaime Escobar on 27/12/20.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var ns
    @State private var showDetails: Bool = false
    var body: some View {
        VStack {
            Spacer()
            if showDetails {
                MusicPlayerView(namespace: ns)
            } else {
                MusicPlayerBarView(namespace: ns)
            }
        }.onTapGesture {
            withAnimation(.spring()) {
                showDetails.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct MusicPlayerBarView: View {
    let namespace: Namespace.ID
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("cover")
                    .resizable()
                    .scaledToFit().frame(width: 80, height: 80).cornerRadius(8.0).matchedGeometryEffect(id: "imageAnimation", in: namespace)
                VStack(alignment: .leading) {
                    Text("Blinding Lights").font(.headline)
                    Text("The Weeknd").font(.subheadline)
                }.matchedGeometryEffect(id: "textAnimation", in: namespace)
                Spacer()
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.secondary)
                    })
                    Button(action: {}, label: {
                        Image(systemName: "forward.fill")
                            .foregroundColor(.secondary)
                    })
                }.matchedGeometryEffect(id: "buttonAnimation", in: namespace)
            }.padding()
            .background(Color.secondary.opacity(0.5))
        }
    }
}

struct MusicPlayerView: View {
    let namespace: Namespace.ID
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Image("cover")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8.0)
                    .matchedGeometryEffect(id: "imageAnimation", in: namespace)
                VStack(alignment: .leading) {
                    Text("Blinding Lights").font(.title2)
                    Text("The Weeknd").font(.title2)
                }.matchedGeometryEffect(id: "textAnimation", in: namespace)
            }
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "backward.fill")
                        .foregroundColor(.primary)
                })
                Button(action: {}, label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(.primary)
                })
                Button(action: {}, label: {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.primary)
                })
            }.font(.title).matchedGeometryEffect(id: "buttonAnimation", in: namespace)
            Spacer()
        }.padding(20)
        .frame(width: UIWindow().frame.width, height: UIWindow().frame.height * 0.7)
    }
}
