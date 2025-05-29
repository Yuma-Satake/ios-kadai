//
//  PianoWhite.swift
//  Kadai04
//
//  Created by Yuma Satake on 2025/05/29.
//

import SwiftUI

struct PianoWhite: View {
    let soundManager = PianoSoundManager()
    
    var body: some View {
        HStack(spacing: 0) {
            // ド (1do)
            Button(action: {
                soundManager.playPianoSound(soundName: "1do")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // レ (2re)
            Button(action: {
                soundManager.playPianoSound(soundName: "2re")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // ミ (3mi)
            Button(action: {
                soundManager.playPianoSound(soundName: "3mi")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // ファ (4fa)
            Button(action: {
                soundManager.playPianoSound(soundName: "4fa")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // ソ (5so)
            Button(action: {
                soundManager.playPianoSound(soundName: "5so")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // ラ (6ra)
            Button(action: {
                soundManager.playPianoSound(soundName: "6ra")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // シ (7si)
            Button(action: {
                soundManager.playPianoSound(soundName: "7si")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
            
            // ド (8do)
            Button(action: {
                soundManager.playPianoSound(soundName: "8do")
            }) {
                Image(.WHITE)
                    .resizable()
                    .frame(width: 80, height: 400)
                    .scaledToFit()
            }
        }
        .frame(height: 400)
    }
}

#Preview {
    PianoWhite()
} 