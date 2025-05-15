import SwiftUI

private enum Direction: Int, CaseIterable, Identifiable {
    case left, up, down, right

    var id: Int { rawValue }

    var arrowImageName: String {
        switch self {
        case .left:  return "arrow.left"
        case .up:    return "arrow.up"
        case .down:  return "arrow.down"
        case .right: return "arrow.right"
        }
    }

    var fingerImageName: String {
        switch self {
        case .left:  return "hand.point.left"
        case .up:    return "hand.point.up"
        case .down:  return "hand.point.down"
        case .right: return "hand.point.right"
        }
    }

    var labelText: String {
        switch self {
        case .left:  return "左"
        case .up:    return "上"
        case .down:  return "下"
        case .right: return "右"
        }
    }

    var faceImageName: String {
        switch self {
        case .left:  return "left"           case .up:    return "top"           case .down:  return "bottom"  
        case .right: return "right"           }
    }
}

struct ContentView: View {
    @State private var randomDirection: Direction? = nil
    
    @State private var resultText: String = "結果・・・"
    
    @State private var winCount: Int = 0

    var body: some View {
        VStack(spacing: 32) {
            
            Text("あっち向いて・・・ほい！")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            
            Group {
                if let direction = randomDirection {
                    Image(direction.faceImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .animation(.easeInOut, value: direction)
                } else {
                    Image("center") 
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
            }
            .padding(.vertical, 16)

            
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

            
            VStack(spacing: 8) {
                Text(resultText)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("勝った回数\(winCount)回")
                    .font(.title2)
            }
            .padding(.top, 24)

            Spacer()

            
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

    
    private func play(selected: Direction) {
        let generated = Direction.allCases.randomElement()!
        randomDirection = generated

        if selected == generated {
            resultText = "勝ち！！"
            winCount += 1
        } else {
            resultText = "もう一回"
        }
    }

    private func reset() {
        randomDirection = nil
        resultText = "結果・・・"
        winCount = 0
    }
}

#Preview {
    ContentView()
}
