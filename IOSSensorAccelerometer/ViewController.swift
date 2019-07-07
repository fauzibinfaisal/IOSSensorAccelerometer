//
//  ViewController.swift
//  IOSSensorAccelerometer
//
//  Created by Fauzi Fauzi on 06/07/19.
//  Copyright © 2019 Fauzi. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var valueXLabel: UILabel!
    
    //TODO 1: import CoreMotion and initialize it
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startAccelerometer(_ sender: UIButton) {
        //TODO 2: Check if sensor is available
        if motionManager.isAccelerometerAvailable{
            
            // TODO 3: Set interval sensor updated in second
            motionManager.accelerometerUpdateInterval = 0.1
            
            // Todo 4: Start sensor and give an action every time interval
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                print("Accelerometer \(String(describing: data))")
                
                if ((data!.acceleration.x > 0.5)){
                    self.textLabel.text = "I'm moving FASTER to the RIGHT!"
                }else if (data!.acceleration.x < -0.5){
                    self.textLabel.text = "I'm moving FASTER to the LEFT!"
                }else{
                    self.textLabel.text = "I'm moving SLOW"
                }
                self.valueXLabel.text = String(format: "%.2f", (((data?.acceleration.x)!)))

            }
        }
    }
    
    @IBAction func stopAccelerometer(_ sender: UIButton) {
        // TODO 5: Stop Accelerometer
        motionManager.stopAccelerometerUpdates()
        
        
    }
    
}

