//
//  DeviceManager.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/14.
//

import DeviceKit

public enum DeviceGroup {
   case fourInches
   case fiveInches
   case xSeries
   case iPads
   public var rawValue: [Device] {
      switch self {
      case .fourInches:
         return [.iPhone5s, .iPhoneSE]
      case .fiveInches:
        return [.iPhone6, .iPhone6s, .iPhone7, .iPhone8, .simulator(.iPhone8)]
      case .xSeries:
         return Device.allXSeriesDevices
      case .iPads:
         return Device.allPads
      }
   }
}

class DeviceManager {
   static let shared: DeviceManager = DeviceManager()
   func isFourIncheDevices() -> Bool {
       print("asdfasdfasd : \(DeviceGroup.fourInches.rawValue)")
      return Device.current.isOneOf(DeviceGroup.fourInches.rawValue)
   }
   func isIPadDevices() -> Bool {
      return Device.current.isOneOf(DeviceGroup.iPads.rawValue)
   }
}

