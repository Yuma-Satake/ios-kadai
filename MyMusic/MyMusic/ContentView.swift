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
            HStack {
                Button{
                    soundPlayer.cymbalPlay()
                } label: {
                    Image(.cymbal)
                        .resizable()
                        .scaledToFit()
                }               
            }
        }
    }
}

#Preview {
    ContentView()
}
