//
//  ContentView.swift
//  Kadai01
//
//  Created by ios1a on 2025/05/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 8) {
                Image("youtube")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 26)

                Text("YokuTaberu")
                    .font(.system(size: 24, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("douga_haishin_youtuber")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .cornerRadius(4)
            
            HStack(alignment: .top, spacing: 8) {
                Image("foodfighter_man")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text("【売り切れ必須】ついに…あの商品が新しくなって復活！！！")
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(2)

                    Text("パクパクch ・ 1500万回視聴 ・ 3日前")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
