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
  
  let progressHud = CircleProgressView.shared
  
  // MARK: - init
  override init() {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    super.init()
  }
  
  // progressHud 애니메이션 동작하기
  func startAnimation() {
    setWindow()
    makeProgressHud()
  }
  
  // progressHud 애니메이션 스탑
  func stopAnimation() {
    dismissProgressHud()
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
    window.addSubview(progressHud)
    
    progressHud.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.height.equalTo(30)
    }
    progressHud.startAnimation()
  }
  
  // progressHud 삭제
  func dismissProgressHud() {
    progressHud.removeFromSuperview()
    progressHud.stopAnimation()
  }
}
