import Foundation
import SwiftUI

@MainActor
final class ZipSearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var addresses: [ZipAddress] = []
    @Published var isLoading: Bool = false
    @Published var alertMessage: String?

    func search() {
        let sanitized = query.digitsOnlyHalfWidth
        guard sanitized.count == 7 else {
            alertMessage = "郵便番号を7桁の数字で入力してください"
            addresses.removeAll()
            return
        }
        fetch(zipcode: sanitized)
    }

    private func fetch(zipcode: String) {
        isLoading = true
        alertMessage = nil
        addresses.removeAll()
        guard let url = URL(string: "https://zipcloud.ibsnet.co.jp/api/search?zipcode=\(zipcode)") else {
            alertMessage = "URL生成に失敗しました"
            isLoading = false
            return
        }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let response = try decoder.decode(ZipcodeResponse.self, from: data)
                self.isLoading = false
                if response.status == 200, let results = response.results {
                    if results.isEmpty {
                        self.alertMessage = "該当する住所が見つかりませんでした"
                    }
                    self.addresses = results
                } else {
                    self.alertMessage = response.message ?? "エラーが発生しました"
                }
            } catch {
                self.isLoading = false
                self.alertMessage = "通信に失敗しました: \(error.localizedDescription)"
            }
        }
    }
} 