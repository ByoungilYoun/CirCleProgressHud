//
//  ProgressHudManager.swift
//  CirCleProgressHud
//
//  Created by 윤병일 on 2023/01/12.
//

import UIKit
import SnapKit

class ProgressHudManager : NSObject {
  
  // MARK: - Properties
  static let shared = ProgressHudManager()
  
  // 새로운 윈도우
  var window : UIWindow
  
  // MARK: - init
  override init() {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window.windowScene = UIApplication.shared.connectedScenes.first! as? UIWindowScene
    super.init()
  }
  
  // progressHud 애니메이션 동작하기
  func startAnimation() {
    setWindow()
    makeProgressHud()
  }
  
  // progressHud 애니메이션 스탑
  func stopAnimation() {
    removeWindow()
  }
  
  // 윈도우 세팅
  func setWindow() {
    window.alpha = 1
    window.isHidden = false
    window.subviews.forEach({ v in
      v.removeFromSuperview()
    })
    window.layoutIfNeeded()
  }
  
  // 윈도우 삭제
  func removeWindow() {
    window.alpha = 0
    window.isHidden = true
    window.layoutIfNeeded()
  }
  
  // progressHud 세팅
  func makeProgressHud() {
    let progressHud = CircleProgressView(frame: UIScreen.main.bounds)
    window.addSubview(progressHud)
    progressHud.startAnimation()
  }
}
