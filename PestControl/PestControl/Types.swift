//
//  Types.swift
//  PestControl
//
//  Created by Amy Joscelyn on 11/17/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation

enum Direction: Int
{
  case forward = 0, backward, left, right
}

typealias TileCoordinates = (column: Int, row: Int)

struct PhysicsCategory
{
  static let None:      UInt32 = 0
  static let All:       UInt32 = 0xFFFFFFFF
  static let Edge:      UInt32 = 0b1
  static let Player:    UInt32 = 0b10
  static let Bug:       UInt32 = 0b100
  static let Firebug:   UInt32 = 0b1000
  static let Breakable: UInt32 = 0b10000
}
