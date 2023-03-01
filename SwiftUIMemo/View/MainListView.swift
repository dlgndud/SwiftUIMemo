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
            List {
                ForEach(store.list) {
                    memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .navigationTitle("내 메모")
            .listStyle(.plain)
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
        .navigationViewStyle(.stack) // 강의 영상에서 빠진 부분을 추가로 구현함
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
