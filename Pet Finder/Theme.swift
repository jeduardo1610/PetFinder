//
//  Theme.swift
//  Pet Finder
//
//  Created by Jorge Eduardo on 19/10/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit

enum Theme : Int{
  case `default`, dark, graphical
  
  private enum Keys {
    static let selectedTheme = "SelectedThem"
  }
  
  static var current : Theme{
    let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
    return Theme(rawValue: storedTheme) ?? .default
  }
  
  var mainColor: UIColor {
    switch self {
    case .default:
      return UIColor(red: 85.0/255.0, green: 190.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    case .dark:
      return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    case .graphical:
      return UIColor(red: 14.0/255.0, green: 14.0/255.0, blue: 14.0/255.0, alpha: 1.0)
    }
  }
  
  var barStyle: UIBarStyle {
    switch self {
    case .default, .graphical:
      return .default
    case .dark:
      return .black
    }
  }
  
  var navigationBackgroundImage : UIImage?{
    return self == .graphical ? UIImage(named:"navBackground"):nil
  }
  
  var tabBarBackgroundImage : UIImage?{
    return self == .graphical ? UIImage(named: "tabBarBackground"):nil
  }
  
  func apply() {
    
    //General Config
    UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    UserDefaults.standard.synchronize()
    UIApplication.shared.delegate?.window??.tintColor = mainColor
    
    //UINavigationBar Config
    UINavigationBar.appearance().barStyle = barStyle
    UINavigationBar.appearance().setBackgroundImage(navigationBackgroundImage, for: .default)
    UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
    UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
    
    //UITabBar Config
    UITabBar.appearance().barStyle = barStyle
    UITabBar.appearance().backgroundImage = tabBarBackgroundImage
    
    let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.withRenderingMode(.alwaysTemplate)
    //this rendering mode takes only shape but not color
    let tabResizableIndicator = tabIndicator?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 0))
    UITabBar.appearance().selectionIndicatorImage = tabResizableIndicator
    
  }
  
}
