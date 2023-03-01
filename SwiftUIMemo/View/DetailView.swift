//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by HOO YOUNG LEE on 2023/03/01.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        VStack{
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content).padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style: .date).padding().font(.footnote).foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Nice")).environmentObject(MemoStore())
    }
}
