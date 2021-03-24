//
//  ViewController.swift
//  HW13
//
//  Created by mac on 22.03.2021.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var currentLabel: UILabel!
    
var currentNumber = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentLabel.text = "\(currentNumber)"
        animation()
    }

    
    @IBAction func lastButton(_ sender: Any) {
        mainView.layer.removeAllAnimations()
        
        currentNumber -= 1
        if currentNumber == 0 {
            currentNumber = 7
        }
        currentLabel.text = "\(currentNumber)"
        animation()
    }
        
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        mainView.layer.removeAllAnimations()

        currentNumber += 1
        if currentNumber == 8 {
            currentNumber = 1
        }
        currentLabel.text = "\(currentNumber)"
        animation()

    }

    
    func animation() {
        switch currentNumber {
        case 1:
            self.mainView.transform = CGAffineTransform(translationX: 0, y: 0)
            let anim = CABasicAnimation(keyPath: "backgroundColor")
            anim.fromValue = UIColor.red.cgColor
            anim.toValue = UIColor.yellow.cgColor
            anim.duration = 2.0
            mainView.layer.add(anim, forKey: "backgroundColor")
            mainView.layer.backgroundColor = UIColor.red.cgColor

        case 2:
            UIView.animate(withDuration: 2.0, delay: 0.4, animations: {
                self.mainView.transform = CGAffineTransform(translationX: 100, y: -100)
                
            }, completion: nil)
            
        case 3:
            self.mainView.transform = CGAffineTransform(translationX: 0, y: 0)
            let anim = CABasicAnimation(keyPath: "cornerRadius")
            anim.fromValue = NSNumber(value: 0)
            anim.toValue = NSNumber(value: Int(self.mainView.layer.frame.width)/2)
            anim.duration = 2.0
            mainView.layer.add(anim, forKey: "cornerRadius")
            mainView.layer.cornerRadius = 0

        case 4:
            UIView.animateKeyframes(withDuration: 2.0, delay: 0.4) {
                self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }

        case 5:
            let anim = CABasicAnimation(keyPath: "opacity")
            anim.fromValue = 1
            anim.toValue = 0
            anim.duration = 2.0
            mainView.layer.add(anim, forKey: "opacity")
            mainView.layer.opacity = 1
        case 6:
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 2
            animation.toValue = 1
            animation.duration = 2.0
            mainView.layer.add(animation, forKey: "transform.scale")
            
        case 7:
            let anim = CABasicAnimation(keyPath: "transform.rotation")
            anim.fromValue = 0
            anim.toValue = CGFloat.pi*2
            anim.duration = 2.0
            anim.repeatCount = Float.infinity
            mainView.layer.add(anim, forKey: "transform.rotation")
        default:
            break
        }
    }
    
}
