//
//  MyPedometer.swift
//  StepWidget
//
//  Created by Takuya Ando on 2023/02/22.
//

import Foundation
import CoreMotion

class MyPedometer: NSObject, ObservableObject {
    
    @Published var isStarted = false
    @Published var isWalking = false
    @Published var count = 0
    
    let pedometer = CMPedometer()
    
    func start() {
        guard !isStarted else {
            return
        }
        
        isStarted = true
        
        pedometer.stopEventUpdates { (event, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            
            DispatchQueue.main.async {
                if event!.type == CMPedometerEventType.pause {
                    self.isWalking = false
                } else {
                    self.isWalking = true
                }
            }
        }
    }
}

