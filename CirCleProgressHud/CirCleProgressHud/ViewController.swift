//
//  ViewController.swift
//  CirCleProgressHud
//
//  Created by 윤병일 on 2023/01/12.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    showProgressHud()
  }

  // MARK: - Functions
  func showProgressHud() {
    ProgressHudManager.shared.startAnimation()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      ProgressHudManager.shared.stopAnimation()
    }
  }
}

