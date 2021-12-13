//
//  MenuButton.swift
//  elepro
//
//  Created by enPiT2016MBP-01 on 2021/12/13.
//

import SwiftUI

struct ButtonBottom: View {//下にあるメニューボタン
    var body: some View {
        NavigationView {
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        ButtonTrade()
                        ButtonWrite()
                        ButtonRead()
                        ButtonSettings()
                    }
                }
            
            
        }
    }

}

struct ButtonTrade: View {//下にあるメニューボタン
    var body: some View {
        Button("交換") {}
        Spacer()
    }
}

struct ButtonWrite: View {//下にあるメニューボタン
    var body: some View {
        Button("書く") {}
        Spacer()
    }
}

struct ButtonRead: View {//下にあるメニューボタン
    var body: some View {
        Button("読む") {}
        Spacer()
    }
}

struct ButtonSettings: View {//下にあるメニューボタン
    var body: some View {
        Button("設定") {}
        Spacer()
    }
}
