//
//  RefreshLoadMoreView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023-09-22.
//

import SwiftUI

public struct RefreshLoadMoreView: View {
    
    public init() {}
    
    @State private var items: [String] = Array()
    @State private var isLoading = false
    @State private var isRefreshing = false
    @State private var canLoadMore = true

    public var body: some View {
        NavigationView {
            List {
                if isRefreshing {
                    ProgressView("Refreshing...")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .onAppear {
                            if item == items.last, !isLoading, canLoadMore {
                                loadMore()
                            }
                        }
                }
                if isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .refreshable {
                refreshData()
            }
            .onAppear {
                refreshData()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                   HStack(spacing: 50) {
                       Button(action: {
                           if !isRefreshing {
                               refreshData()
                           }
                       }) {
                           Text("Refresh")
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                       Button(action: {
                           if !isLoading {
                               loadMore()
                           }
                       }) {
                           Text("load More")
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                   }
                   .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("Refresh & Load More")
        }
    }

    func refreshData() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            items = Array(1...20).map { "item \($0) + Timestamp:\(formattedCurrentTime())" }
            isRefreshing = false
            canLoadMore = true
        }
    }

    func loadMore() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let newItems = Array(items.count + 1...items.count + 20).map { "item \($0) + Timestamp:\(formattedCurrentTime())" }
            items.append(contentsOf: newItems)
            isLoading = false
            canLoadMore = newItems.count == 20
        }
    }

    func formattedCurrentTime() -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "HH:mm:ss"
         return dateFormatter.string(from: Date())
     }
}

struct RefreshLoadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshLoadMoreView()
    }
}
