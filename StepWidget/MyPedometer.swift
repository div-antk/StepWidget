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
        
        pedometer.startEventUpdates { (event, error) in
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
        
        pedometer.startUpdates(from: Date()) { (data, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return
            }
            DispatchQueue.main.async {
                self.count = data?.numberOfSteps as! Int
            }
        }
    }
    
    func stop() {
        guard isStarted else {
            return
        }
        
        isStarted = false
        
        pedometer.stopUpdates()
        pedometer.stopEventUpdates()
    }
}

