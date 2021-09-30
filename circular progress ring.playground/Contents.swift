import UIKit
//定義: 度數,線寬,半徑,起始方位
let aDegree = CGFloat.pi / 180

let lineWidth : CGFloat = 10

let radius : CGFloat = 50

let startDegree : CGFloat = 270
//!!!!底層!!!!
//定義“底層”圓形路徑
let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth, y: lineWidth, width: radius * 2, height: radius * 2))

let circleLayer = CAShapeLayer()

circleLayer.path = circlePath.cgPath

circleLayer.strokeColor = UIColor.gray.cgColor

circleLayer.lineWidth = lineWidth

circleLayer.fillColor = UIColor.clear.cgColor


//設定進度條
let percentage : CGFloat = 50

let percentagePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth + radius, y: lineWidth + radius), radius:radius, startAngle: aDegree * startDegree, endAngle: aDegree * (startDegree + 360 * percentage / 100), clockwise: true)
let percentageLayer = CAShapeLayer()

percentageLayer.path = percentagePath.cgPath

percentageLayer.strokeColor = UIColor.blue.cgColor

percentageLayer.lineWidth = lineWidth

percentageLayer.fillColor = UIColor.clear.cgColor


//使進度條兩邊變成圓弧(.round)/方形(.square)
percentageLayer.lineCap = .square



//文字位置＆進度％
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2 * (radius + lineWidth), height: 2 * (radius + lineWidth)))

label.textAlignment = .center

label.text = "\(percentage)%"

let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 2 * (radius + lineWidth), height: 2 * (radius + lineWidth)))
        lable.textAlignment = .center
        
        let lableText = Int(percentage)
        lable.text = "\(lableText)%"
        lable.textColor = UIColor.cyan
        lable.font = UIFont(name: "AlienLeagueBold", size: 32)




//將底層＆上層＆文字加入view
let view = UIView(frame: label.frame)
view.layer.addSublayer(circleLayer)
view.layer.addSublayer(percentageLayer)
view.addSubview(label)

view
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
