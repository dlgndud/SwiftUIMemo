//
//  ComposerView.swift
//  SwiftUIMemo
//
//  Created by HOO YOUNG LEE on 2023/02/28.
//

import SwiftUI

struct ComposerView: View {
    
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
        
    var body: some View {
        NavigationView {
            VStack {
                // 2way binding
                TextEditor(text: $content).padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집":"새 메모")
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Text("취소")
                            }
                        }

                    ToolbarItemGroup(placement:.navigationBarTrailing) {
                        Button {
                            
                            if let memo = memo {
                                store.update(memo: memo, content: content)
                            } else {
                                store.insert(memo: content)
                            }
                            
                            dismiss()
                        } label: {
                            Text(memo != nil ? "업데이트" : "저장")
                        }
                    }
                }
        }
    }

}

struct ComposerView_Previews: PreviewProvider {
    static var previews: some View {
        ComposerView()
            .environmentObject(MemoStore())
    }
}
