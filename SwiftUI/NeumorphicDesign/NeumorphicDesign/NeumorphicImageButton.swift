//
//  NeumorphicImageButton.swift
//  NeumorphicDesign
//
//  Created by Jaime Escobar on 29/01/21.
//

import SwiftUI

struct NeumorphicImageButton: View {
    private var onTap: () -> Void
    private var systemName: String
    private var size: CGSize
    @State private var isPressed = false
    
    init(systemName: String, size: CGSize = CGSize(width: 60, height: 60),onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.size = size
        self.onTap = onTap
    }
    var body: some View {
        Button.init(action: {
            self.isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.isPressed = false
            }
            onTap()
        }, label: {
            Image(systemName: systemName)
                .resizable()
                .frame(width: size.width, height: size.height)
                .padding(size.width)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        })
        .clipShape(Circle())
        .shadow(color: isPressed ? .white : .gray, radius: isPressed ? 1 : 10, x: isPressed ? 0 : 10, y: isPressed ? 0 : 10)
        .shadow(color: isPressed ? .gray : .white, radius: isPressed ? 1 : 10, x: isPressed ? 0 : -10, y: isPressed ? 0 : -10)
        .scaleEffect(isPressed ? 0.85 : 1.0)
        .animation(.spring())
    }
}

struct NeumorphicImageButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageButton(systemName: "play.fill") {}
    }
}
