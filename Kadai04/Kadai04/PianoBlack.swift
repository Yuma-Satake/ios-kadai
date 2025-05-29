//
//  PianoBlack.swift
//  pianoApp
//
//  Created by ios2b on 2024/05/22.
//

import SwiftUI

struct PianoBlack: View {
    var body: some View {
        HStack {
            Spacer()
            Spacer()
            Image(.BK)
                .resizable()
                .frame(width: 50,height: 250)
                .scaledToFit()
            Spacer()
            Image(.BK)
                .resizable()
                .frame(width: 50,height: 250)
                .scaledToFit()
            Spacer()
            Spacer()
            Image(.BK)
                .resizable()
                .frame(width: 50,height: 250)
                .scaledToFit()
            Spacer()
            Image(.BK)
                .resizable()
                .frame(width: 50,height: 250)
                .scaledToFit()
            Spacer()
            Image(.BK)
                .resizable()
                .frame(width: 50,height: 250)
                .scaledToFit()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }.padding(.leading, 29.0).frame(width:900, height: 330,alignment: .top)
    }
}

#Preview {
    PianoBlack()
}
