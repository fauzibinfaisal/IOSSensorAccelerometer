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
    @IBOutlet weak var backgroundView: UIView!
    
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
                if let dataAccel = data {
                  print(dataAccel)
                    
                    if ((dataAccel.acceleration.x > 0.1)){
                        self.textLabel.text = "I'm moving FASTER to the RIGHT!"
                        self.backgroundView.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: CGFloat(dataAccel.acceleration.x))
                        
                    }else if (dataAccel.acceleration.x < -0.1){
                        self.textLabel.text = "I'm moving FASTER to the LEFT!"
                        self.backgroundView.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: CGFloat(abs(dataAccel.acceleration.x)))
                    }else{
                        self.textLabel.text = "I'm moving SLOW"
                        self.backgroundView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha:0)
                    }
                    self.valueXLabel.text = String(format: "%.2f", (((data?.acceleration.x)!)))
                }
                
                


            }
        }
    }
    
    @IBAction func stopAccelerometer(_ sender: UIButton) {
        // TODO 5: Stop Accelerometer
        motionManager.stopAccelerometerUpdates()
        
        
    }
    
}

