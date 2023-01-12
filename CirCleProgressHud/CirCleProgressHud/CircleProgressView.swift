//
//  CircleProgressView.swift
//  CirCleProgressHud
//
//  Created by 윤병일 on 2023/01/12.
//

import UIKit

class CircleProgressView : UIView {
  
  // MARK: - Properties
  var circleLayer = CAShapeLayer()
  var progressLayer = CAShapeLayer()
  var startPoint = CGFloat(-Double.pi / 2)
  var endPoint = CGFloat(3 * Double.pi / 2)
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    createCircularPath()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Functions
  func createCircularPath() {
    let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 20, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    
    circleLayer.path = circularPath.cgPath
    circleLayer.fillColor = UIColor.clear.cgColor
    circleLayer.lineCap = .round
    circleLayer.lineWidth = 10.0
    circleLayer.strokeEnd = 1.0
    circleLayer.strokeColor = UIColor.clear.cgColor
    
    layer.addSublayer(circleLayer)
    
    progressLayer.path = circularPath.cgPath
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.lineCap = .round
    progressLayer.lineWidth = 5.0
    progressLayer.strokeEnd = 0
    progressLayer.strokeColor = UIColor.blue.cgColor
    
    layer.addSublayer(progressLayer)
  }
  
  func startAnimation() {
    let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    circularProgressAnimation.duration = 0.7
    circularProgressAnimation.toValue = 1.0
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    circularProgressAnimation.repeatCount = 1000
    progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
  }
  
  func stopAnimation() {
    circleLayer.removeFromSuperlayer()
    circleLayer.removeAllAnimations()
    progressLayer.removeFromSuperlayer()
    progressLayer.removeAllAnimations()
  }
}
