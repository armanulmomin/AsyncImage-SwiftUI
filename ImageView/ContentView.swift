//
//  ContentView.swift
//  ImageView
//
//  Created by Arman on 23/10/25.
//

import SwiftUI
extension Image {
    func imageModifier() -> some View{
        self
        .resizable()
        .scaledToFit()
    }
    
    func imageIconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 120)
            .foregroundStyle(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageUrl: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
//        AsyncImage(url: URL(string: imageUrl)) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").imageIconModifier()
//        }
//        .padding(40)
        
        AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            if let image = phase.image{
                image.imageModifier().transition(.scale)
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").imageIconModifier()
            } else {
                Image(systemName: "photo.circle.fill").imageIconModifier()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
