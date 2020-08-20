//
//  ContentView.swift
//  CoreMLSwiftUI
//
//  Created by Jaime Escobar on 19/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let images = ["cat", "dog", "tree"]
    @ObservedObject var vm = ImageDetectionViewModel()
    @State var selectedImage = ""
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.images, id: \.self) { image in
                            Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                            .border(Color.green, width: self.selectedImage == image ? 10 : 0)
                            .cornerRadius(8)
                            .onTapGesture {
                                self.selectedImage = image
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }.padding(.vertical, 20)
                Text(self.vm.predictionLabel)
                    .padding()
                Button(action: {
                    print(self.selectedImage)
                    self.vm.detect(self.selectedImage)
                }) {
                    Text("Detect")
                    .frame(width: (UIScreen.main.bounds.width - 40), height: 40)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
                }
            }
            .navigationBarTitle("CoreML")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.dark)
    }
}
