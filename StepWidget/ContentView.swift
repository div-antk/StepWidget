//
//  ContentView.swift
//  StepWidget
//
//  Created by Takuya Ando on 2023/02/21.
//

import SwiftUI

// WeekDayWorrier
// 何曜日からスタートするか設定

let pedometor = CMPedometer()

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
