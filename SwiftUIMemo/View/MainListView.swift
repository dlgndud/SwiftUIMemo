//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by HOO YOUNG LEE on 2023/02/28.
//

import SwiftUI

struct MainListView: View {
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    
    var body: some View {
        NavigationView {
            List(store.list) {
                memo in
                NavigationLink {
                    DetailView(memo: memo)
                } label: {
                    MemoCell(memo: memo)
                }

                
            }.navigationTitle("내 메모").listStyle(.plain)
                .toolbar{
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showComposer) {
                    ComposerView()
                }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
