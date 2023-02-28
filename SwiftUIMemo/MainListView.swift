//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by HOO YOUNG LEE on 2023/02/28.
//

import SwiftUI

struct MainListView: View {
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        NavigationView {
            List(store.list) {
                memo in MemoCell(memo: memo)
            }.navigationTitle("내 메모").listStyle(.plain)
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}


