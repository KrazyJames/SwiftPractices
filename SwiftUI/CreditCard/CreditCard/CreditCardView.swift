//
//  CreditCardView.swift
//  CreditCard
//
//  Created by Jaime Escobar on 28/01/21.
//

import SwiftUI

struct CreditCardView<Content>: View where Content: View {
    var content: () -> Content
    var body: some View {
        content()
    }
}

struct FrontCard: View {
    var number: String
    var holder: String
    var expiration: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "creditcard.fill")
                    .foregroundColor(.white)
                Spacer()
                Text("VISA")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            Spacer()
            Text(number)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("HOLDER")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(holder)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                Spacer()
                VStack {
                    Text("EXPIRES")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(expiration)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
            }
        }
        .padding()
        .frame(width: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .padding()
    }
}

struct BackCard: View {
    var cvv: String
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .frame(width: .infinity, height: 10)
                .foregroundColor(.clear)
            Rectangle()
                .frame(width: .infinity, height: 40)
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("CVV")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(cvv)
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.medium)
                }.rotation3DEffect(
                    .degrees(180),
                    axis: (x: 0.0, y: 1.0, z: 0.0))
                .padding(5)
                Spacer()
            }
            .frame(width: 120)
            .background(Color.white)
            .padding()
            Spacer()
        }
        .frame(width: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .padding()
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView<BackCard>(content: { BackCard(cvv: "123") }).frame(height: 250)
    }
}
