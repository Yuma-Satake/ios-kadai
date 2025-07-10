import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ZipSearchViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack {
                    TextField("郵便番号 (例: 1000001)", text: $viewModel.query)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .submitLabel(.search)
                        .onSubmit {
                            viewModel.search()
                        }

                    Button("検索") {
                        viewModel.search()
                    }
                    .buttonStyle(.borderedProminent)
                }

                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if !viewModel.addresses.isEmpty {
                    List(viewModel.addresses) { address in
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(address.address1) \(address.address2) \(address.address3)")
                                .font(.body)
                            Text("郵便番号: \(address.zipcode)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                } else {
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("郵便番号検索")
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.alertMessage != nil },
                set: { newValue in
                    if !newValue { viewModel.alertMessage = nil }
                }
            )) {
                Alert(title: Text("エラー"), message: Text(viewModel.alertMessage ?? ""), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    ContentView()
}
