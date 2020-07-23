//
//  ContentView.swift
//  ComplexUI
//
//  Created by Jaime Escobar on 23/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var width = UIScreen.main.bounds.width
    @State var data = [
        DataType(name: "Bananas", price: "$5/Dozen", content: "Bananas are high in potassium and contain goog levels of protien and dietary fiber.One medium-sized banana contains 422 milligrams of potassium.", calories: "89", expand: ["0.3 g","23 g","1.1 g"],color: Color(.yellow),image: "bananas"),
        DataType(name: "Apples", price: "$5/Kg", content: "Apple contributes nearly 20 vitamins and minerals,making it a great nutrient-dense food choice.It also contains heart-healthy monounsaturated fat - good dat! ", calories: "120", expand: ["1.5 g","90 g","2 g"],color: Color(.red),image: "apples"),
        DataType(name: "Peaches", price: "$25/Kg", content: "They're an excellent source of vitamin C and manganese and also contain decent amounts of folate(vitamin B9) and potassium.", calories: "102", expand: ["0.3 g","8 g","0.7 g"],color: Color(.systemOrange),image: "peaches")
    ]
    @State var index = 0
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back").bold()
                        }
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bag.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                }
                .foregroundColor(.gray)
                
                HStack {
                    Button(action: {
                        if self.index != 0 {
                            self.index -= 1
                        }
                    }) {
                        Image(systemName: "arrow.left")
                            .padding(8)
                            .foregroundColor(Color.white)
                    }
                    .background(Color.gray)
                    .clipShape(Circle())
                    .opacity(self.index != 0 ? 1 : 0.5)
                    .disabled(self.index == 0)
                    Image(self.data[self.index].image)
                        .resizable()
                        .frame(width: 256, height: 256, alignment: .center)
                    Button(action: {
                        if self.index != self.data.count-1 {
                            self.index += 1
                        }
                    }) {
                        Image(systemName: "arrow.right")
                            .padding(8)
                            .foregroundColor(Color.white)
                    }
                    .background(Color.gray)
                    .clipShape(Circle())
                    .opacity(self.index != self.data.count - 1 ? 1 : 0.5)
                    .disabled(self.index == self.data.count - 1)
                }
                .padding(.horizontal)
                
                VStack(spacing: 20) {
                    VStack {
                        Text(self.data[self.index].name)
                            .bold()
                            .font(.largeTitle)
                        Text(self.data[self.index].price)
                            .bold()
                    }
                    
                    Text(self.data[self.index].content)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Text("Nutrition Facts")
                        .bold()
                        .font(.title)
                    
                    HStack(spacing: 20) {
                        Image(systemName: "flame.fill")
                            .resizable()
                            .frame(width: 25, height: 35)
                            .foregroundColor(Color.white)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(self.data[self.index].calories)
                                .bold()
                                .foregroundColor(.white)
                            Text("Calories")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                    
                    HStack {
                        Spacer()
                        VStack(alignment: .center, spacing: 10) {
                            Text(self.data[self.index].expand[0])
                                .bold()
                            Text("Fat")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 10) {
                            Text(self.data[self.index].expand[1])
                                .bold()
                            Text("Carbs")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 10) {
                            Text(self.data[self.index].expand[2])
                                .bold()
                            Text("Proteins")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Add to cart")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: self.width - 32)
                        .background(Color.purple)
                }
                .clipShape(Capsule())
                .padding(.top)
            }
            .zIndex(1)
            
            Circle()
                .fill(self.data[self.index].color)
                .frame(width: self.width + 200, height: self.width + 200)
                .padding(.horizontal, -100).offset(y: -self.width + 100)
        }.animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDisplayName("iPhone 11")
    }
}

struct DataType {
    
    var name : String
    var price : String
    var content : String
    var calories : String
    var expand : [String]
    var color : Color
    var image : String
}
