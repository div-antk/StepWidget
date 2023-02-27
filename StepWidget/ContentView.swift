//
//  ContentView.swift
//  StepWidget
//
//  Created by Takuya Ando on 2023/02/21.
//

import SwiftUI
import CoreMotion

// WeekDayWorrier
// 何曜日からスタートするか設定

struct ContentView: View {
    
    @ObservedObject var pedometer = MyPedometer()
    
    var body: some View {
        VStack {
            if self.pedometer.isWalking {
                Text("歩いている")
            } else {
                Text("止まっている")
            }
            Text("\(self.pedometer.count)")
            Button(action: {
                if !self.pedometer.isStarted {
                    self.pedometer.start()
                } else {
                    self.pedometer.stop()
                }
            }) {
                if !self.pedometer.isStarted {
                    Text("スタート")
                } else {
                    Text("ストップ")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
