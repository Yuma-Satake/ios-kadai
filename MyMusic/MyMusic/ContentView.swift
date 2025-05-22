//
//  ContentView.swift
//  MyMusic
//
//  Created by Yuma Satake on 2025/05/22.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            HStack(spacing: 40) {
                Button{
                    soundPlayer.cymbalPlay()
                } label: {
                    Image(.cymbal)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                }               
                
                Button{
                    soundPlayer.guitarPlay()
                } label: {
                    Image(.guitar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
