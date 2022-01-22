//
//  ViewController.swift
//  gesture
//
//  Created by Preeti Priyam on 1/18/22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var tempView: UIView!
    
    @IBOutlet weak var tempImageView: UIImageView!
    
    var trayOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempView.isUserInteractionEnabled = true
        self.tempView.isMultipleTouchEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        if translation.x >= 0 && translation.y >= 0  {
            if sender.state == .began {
                trayOriginalCenter = tempView.center
            } else if sender.state == .changed {
                tempView.center = CGPoint(x: trayOriginalCenter.x + translation.x, y: trayOriginalCenter.y + translation.y)
            }
        }
    }
    
    
}

