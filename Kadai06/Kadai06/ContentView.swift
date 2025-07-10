
import SwiftUI

struct ContentView: View {
    @AppStorage("domesticIndex") private var domesticIndex: Int = 0
    @AppStorage("sizeIndex") private var sizeIndex: Int = 0
    @AppStorage("styleIndex") private var styleIndex: Int = 0

    private var recommendedCar: CarInfo {
        let index = domesticIndex * 9 + sizeIndex * 3 + styleIndex
        guard carArray.indices.contains(index) else {
            return CarInfo(fileName: "", carname: "データなし")
        }
        return carArray[index]
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("国産 or 外国車") {
                    Picker("", selection: $domesticIndex) {
                        Text("国産車").tag(0)
                        Text("外国車").tag(1)
                    }
                    .pickerStyle(.segmented)
                }

                Section("車のサイズ") {
                    Picker("", selection: $sizeIndex) {
                        Text("軽自動車").tag(0)
                        Text("コンパクト").tag(1)
                        Text("普通自動車").tag(2)
                    }
                    .pickerStyle(.segmented)
                }

                Section("特徴") {
                    Picker("", selection: $styleIndex) {
                        Text("かわいい").tag(0)
                        Text("かっこいい").tag(1)
                        Text("便利").tag(2)
                    }
                    .pickerStyle(.segmented)
                }

                Section("おすすめのクルマ") {
                    VStack(spacing: 16) {
                        if !recommendedCar.fileName.isEmpty {
                            Image(recommendedCar.fileName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                        } else {
                            Image("NoImage")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .opacity(0.3)
                        }
                        Text(recommendedCar.carname)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("クルマ検索")
        }
    }
}

#Preview {
    ContentView()
}
