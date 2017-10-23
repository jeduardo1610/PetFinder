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
  
  func apply() {
    UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
    UserDefaults.standard.synchronize()
    UIApplication.shared.delegate?.window??.tintColor = mainColor
    
  }
  
}
