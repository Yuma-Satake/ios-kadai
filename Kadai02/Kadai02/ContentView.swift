//
//  ContentView.swift
//  Kadai02
//
//  Created by ios1a on 2025/05/15.
//

import SwiftUI

/// 方向を表す列挙型
private enum Direction: Int, CaseIterable, Identifiable {
    case left, up, down, right

    // MARK: - Identifiable
    var id: Int { rawValue }

    /// 方向に対応する矢印アイコン名（SFSymbols）
    var arrowImageName: String {
        switch self {
        case .left:  return "arrow.left"
        case .up:    return "arrow.up"
        case .down:  return "arrow.down"
        case .right: return "arrow.right"
        }
    }

    /// 方向に対応する指アイコン名（SFSymbols）
    var fingerImageName: String {
        switch self {
        case .left:  return "hand.point.left"
        case .up:    return "hand.point.up"
        case .down:  return "hand.point.down"
        case .right: return "hand.point.right"
        }
    }

    /// ラベル（日本語）
    var labelText: String {
        switch self {
        case .left:  return "左"
        case .up:    return "上"
        case .down:  return "下"
        case .right: return "右"
        }
    }

    /// 方向に対応する顔画像名（アセット）
    var faceImageName: String {
        switch self {
        case .left:  return "left"    // left.png
        case .up:    return "top"     // top.png
        case .down:  return "bottom"  // bottom.png
        case .right: return "right"   // right.png
        }
    }
}

struct ContentView: View {
    // MARK: - State
    /// ランダムに決定された画像の向き（nil のときは初期状態）
    @State private var randomDirection: Direction? = nil
    /// 結果テキスト
    @State private var resultText: String = "結果・・・"
    /// 勝利回数
    @State private var winCount: Int = 0

    var body: some View {
        VStack(spacing: 32) {
            // タイトル
            Text("あっち向いて・・・ほい！")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            // 方向を示す画像
            Group {
                if let direction = randomDirection {
                    Image(direction.faceImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .animation(.easeInOut, value: direction)
                } else {
                    Image("center") // center.png
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
            }
            .padding(.vertical, 16)

            // 指ボタン
            HStack(spacing: 32) {
                ForEach(Direction.allCases) { direction in
                    Button {
                        play(selected: direction)
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: direction.fingerImageName)
                                .font(.system(size: 45))
                                .foregroundStyle(.primary)
                            Text(direction.labelText)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }

            // 結果表示
            VStack(spacing: 8) {
                Text(resultText)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("勝った回数\(winCount)回")
                    .font(.title2)
            }
            .padding(.top, 24)

            Spacer()

            // リセットボタン
            Button {
                reset()
            } label: {
                Text("リセット")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }

    // MARK: - Game Logic
    /// 指ボタンが押されたときの処理
    private func play(selected: Direction) {
        // 乱数で画像の向きを決定
        let generated = Direction.allCases.randomElement()!
        randomDirection = generated

        // 勝敗判定
        if selected == generated {
            resultText = "勝ち！！"
            winCount += 1
        } else {
            resultText = "もう一回"
        }
    }

    /// リセット処理
    private func reset() {
        randomDirection = nil
        resultText = "結果・・・"
        winCount = 0
    }
}

#Preview {
    ContentView()
}
