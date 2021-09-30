import UIKit
//定義: 度數,半徑,起始方位, 加入一個用來裝圖形的view
let aDegree = CGFloat.pi / 180

let radius: CGFloat = 50





var startDegree:CGFloat = 270

let view = UIView(frame: CGRect(x: 0, y: 0, width: 2*(radius), height: 2*(radius)))
//設定進度
var percentages: [CGFloat] = [10,10,10,10,10,10,10,10,10,10]

// for迴圈：將 percentages 內的數字一一代入，代入到數字用盡後結束
for percentage in percentages {
let endDegree = startDegree + 360 * percentage / 100
let percentagePath = UIBezierPath()
percentagePath.move(to: view.center)
percentagePath.addArc(withCenter: view.center, radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * endDegree, clockwise: true)
let percentageLayer = CAShapeLayer()
percentageLayer.path = percentagePath.cgPath
percentageLayer.fillColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)).cgColor
percentageLayer.strokeColor = UIColor.yellow  .cgColor
view.layer.addSublayer(percentageLayer)

 
// 讓終點的度數 = 下次的起點度數
startDegree = endDegree
}
view
