//
//  ViewController.swift
//  gesture
//
//  Created by Preeti Priyam on 1/18/22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    var tempView: UIView!
    var panGesture: UIPanGestureRecognizer!
    @IBOutlet var tempImageView: UIImageView!
    var trayOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x1 = tempImageView.frame.minX + (tempImageView.frame.width/2)
        let y1 = tempImageView.frame.minY + (tempImageView.frame.height/2)
        
        self.tempView = UIView(frame: CGRect(x: x1-40, y: y1-40, width: 40, height: 40))
        self.tempView.backgroundColor = .yellow
        self.view.addSubview(self.tempView)
        self.panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanTray(_:)))
        self.panGesture.delegate = self
        self.tempView.addGestureRecognizer(self.panGesture)
        
        self.tempView.isUserInteractionEnabled = true
        self.tempView.isMultipleTouchEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        let center = self.tempImageView.center
            if sender.state == .began {
                trayOriginalCenter = tempView.center
            } else if sender.state == .changed {
                if self.tempImageView.frame.contains(self.tempView.frame) {
                    tempView.center = CGPoint(x: trayOriginalCenter.x + translation.x, y: trayOriginalCenter.y + translation.y)
                } else {
                    tempView.center = center
                }
            }
    }
}

