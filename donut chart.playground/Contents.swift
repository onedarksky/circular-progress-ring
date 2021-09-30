import UIKit


// 定義度數 aDegree
let aDegree = CGFloat.pi / 180

// 設定線寬
let linewidth:CGFloat = 40

// 設定半徑
let radius: CGFloat = 50


// 設定起始方位
var startDegree:CGFloat = 270


// 加入一個用來裝圖形的view
let view = UIView(frame: CGRect(x: 0, y: 0, width: 2*(radius+linewidth), height: 2*(radius+linewidth)))
let center = CGPoint(x: linewidth + radius, y: linewidth + radius)









var percentages:[CGFloat] = [10,10,10,10,10,10,10,10,10,10]


//增加字的部分
func createLabel(percentage: CGFloat, startDegree: CGFloat) -> UILabel {
let textCenterDegree = startDegree + 360 * percentage / 2 / 100
//使每一個百分比label可以置中
let textPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: aDegree * textCenterDegree, endAngle: aDegree * textCenterDegree, clockwise: true)
//設定label大小
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2*(radius+linewidth), height: 2*(radius+linewidth)))
//設定label底色
label.backgroundColor = UIColor.yellow
//設定label字型大小
label.font = UIFont.systemFont(ofSize: 7)
//label內容加上百分比
label.text = "\(percentage)%"
//label內容自動調整大小到適中
label.sizeToFit()
//label內容對齊中間
label.center = textPath.currentPoint
return label
}


// for迴圈：將 percentages 內的數字一一代入，代入到數字用盡後結束
for percentage in percentages {
  let endDegree = startDegree + 360 * percentage / 100
    

// 畫弧步驟
let percentagePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: aDegree * startDegree, endAngle: aDegree * endDegree, clockwise: true)
    let percentageLayer = CAShapeLayer()
    percentageLayer.path = percentagePath.cgPath
    
    
// 隨機生成顏色
percentageLayer.strokeColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1).cgColor
percentageLayer.fillColor = UIColor.clear.cgColor
percentageLayer.lineWidth = linewidth
view.layer.addSublayer(percentageLayer)
    
    //加字
view.addSubview(createLabel(percentage: percentage, startDegree: startDegree))
    
// 讓終點的度數 = 下次的起點度數
startDegree = endDegree
    
   
}
view
