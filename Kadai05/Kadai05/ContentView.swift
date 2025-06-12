//
//  ContentView.swift
//  Kadai05
//
//  Created by Yuma Satake on 2025/06/12.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.1856, longitude: 136.8997), // 名古屋城
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var annotations: [MapAnnotation] = []
    @State private var showingBookmarkDialog = false
    @State private var currentSearchResult: String = ""
    
    // ブックマーク
    @State private var bookmark1 = "名古屋工学院専門学校"
    @State private var bookmark2 = "熱田神宮"
    
    var body: some View {
        VStack {
            // 検索テキストフィールド
            TextField("地点を検索", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    searchLocation(searchText)
                }
            
            // マップ
            Map(coordinateRegion: $region, annotationItems: annotations) { annotation in
                MapPin(coordinate: annotation.coordinate, tint: .red)
            }
            .onAppear {
                // 初期状態で名古屋城にピンを立てる
                searchLocation("名古屋城")
            }
            
            // ボタン群
            HStack(spacing: 20) {
                // ブックマーク1ボタン
                Button(action: {
                    searchLocation(bookmark1)
                }) {
                    VStack {
                        Image(systemName: "star.circle")
                            .font(.title)
                        Text("ブックマーク１")
                            .font(.caption)
                    }
                }
                
                // ブックマーク2ボタン
                Button(action: {
                    searchLocation(bookmark2)
                }) {
                    VStack {
                        Image(systemName: "star.circle.fill")
                            .font(.title)
                        Text("ブックマーク２")
                            .font(.caption)
                    }
                }
                
                // ブックマーク登録ボタン
                Button(action: {
                    if !currentSearchResult.isEmpty {
                        showingBookmarkDialog = true
                    }
                }) {
                    VStack {
                        Image(systemName: "pencil.circle")
                            .font(.title)
                        Text("ブックマーク登録")
                            .font(.caption)
                    }
                }
                .disabled(currentSearchResult.isEmpty)
            }
            .padding()
        }
        .confirmationDialog("ブックマーク登録", isPresented: $showingBookmarkDialog, titleVisibility: .visible) {
            Button("ブックマーク１に登録") {
                bookmark1 = currentSearchResult
            }
            Button("ブックマーク２に登録") {
                bookmark2 = currentSearchResult
            }
            Button("キャンセル", role: .cancel) { }
        } message: {
            Text("「\(currentSearchResult)」をどちらのブックマークに登録しますか？")
        }

    }
    
    private func searchLocation(_ query: String) {
        guard !query.isEmpty else { return }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error = error {
                print("検索エラー: \(error.localizedDescription)")
                return
            }
            
            guard let response = response,
                  let firstItem = response.mapItems.first else {
                print("検索結果が見つかりませんでした")
                return
            }
            
            let coordinate = firstItem.placemark.coordinate
            
            DispatchQueue.main.async {
                // 地域を更新
                self.region = MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
                
                // アノテーションを更新
                self.annotations = [MapAnnotation(coordinate: coordinate)]
                
                // 現在の検索結果を保存
                self.currentSearchResult = query
            }
        }
    }
}

struct MapAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    ContentView()
}
