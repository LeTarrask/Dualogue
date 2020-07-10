//
//  Caroussel.swift
//  Dualogue
//
//  Created by Alex Luna on 03/07/2020.
//  Copyright © 2020 Garagem Infinita. All rights reserved.
//

import SwiftUI
import Combine

struct Caroussel<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content
    
    @State private var currentIndex: Int = 0
    
    @State private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }
    
    var body: some View {
        /* TO DO: Swipe the images left and right. Maybe this:
        https://github.com/danielsaidi/SwiftUIKit/tree/1c91395e5793634c445d12fab79978fe88f5c41e
        */
        
        ZStack(alignment: .bottom) {
            // Carrousel
            GeometryReader { geometry in
                // 2
                HStack(spacing: 0) {
                    // 3
                    self.content
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading) // 4
                .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0) // 5
                .animation(.spring()) // 6
                .onReceive(self.timer) { _ in
                    // 7
                    self.currentIndex = (self.currentIndex + 1) % 3
                }
            }
            
            // Play / Pause
            HStack {
                Spacer()
                Button(action: { self.timer.upstream.connect().cancel() }, label: {
                    Image(systemName: "pause.fill")
                })
                Button(action: {
                    self.timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
                }, label: {
                    Image(systemName: "play.fill")
                })
            }.padding(5)
            
            // Dot indicator
            HStack(spacing: 3) {
                // 3
                ForEach(0..<self.numberOfImages, id: \.self) { index in
                    // 4
                    Circle()
                        .frame(width: index == self.currentIndex ? 10 : 8,
                               height: index == self.currentIndex ? 10 : 8)
                        .foregroundColor(index == self.currentIndex ? Color.blue : .white)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .padding(.bottom, 8)
                        .animation(.spring())
                }
            }
        }
    }
}

struct Caroussel_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Caroussel(numberOfImages: 3) {
                Image("teste1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                Image("teste2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                Image("teste3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
        }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
    }
}
