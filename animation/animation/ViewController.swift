//
//  ViewController.swift
//  animation
//
//  Created by 江庸冊 on 2021/9/30.
//


import UIKit

class ViewController : UIViewController {
    
    let shape = CAShapeLayer()
    //文字的部分
    private let label : UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .center
        
        label.text = "Ring"
        
        label.font = .systemFont(ofSize: 36, weight: .light)
        
        return label
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        
        
        //設定圈圈
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2)  , endAngle: .pi * 2 , clockwise: true)
        
        
        
        //底圖設定
        let trackShape = CAShapeLayer()
        
        trackShape.path = circlePath.cgPath
        
        trackShape.fillColor = UIColor.clear.cgColor
        
        trackShape.lineWidth = 15
        
        trackShape.strokeColor = UIColor.lightGray.cgColor
        
        view.layer.addSublayer(trackShape)
        
        //進度條設定
        shape.path = circlePath.cgPath
        
        shape.lineWidth = 30
        
        shape.strokeColor = UIColor.red.cgColor
        
        shape.fillColor = UIColor.clear.cgColor
        
        shape.strokeEnd = 0
        
        shape.lineCap = .round
        
        view.layer.addSublayer(shape)
        
        
        //設定按鈕大小 
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-70, width: view.frame.size.width-40, height: 50))
            view.addSubview(button)
        button.setTitle("Animate", for: .normal)
        
        button.backgroundColor = .systemGreen
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    
    }
    
    @objc func didTapButton() {
        //Animate
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        
    }
}
