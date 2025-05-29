//
//  PianoView.swift
//  Kadai04
//
//  Created by Yuma Satake on 2025/05/29.
//

import SwiftUI

struct PianoView: View {
    var body: some View {
        ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Piano keys container
                ZStack {
                    // White keys (background layer)
                    PianoWhite()
                    
                    // Black keys (foreground layer)
                    PianoBlack()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    PianoView()
} 