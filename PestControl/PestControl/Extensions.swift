//
//  Extensions.swift
//  PestControl
//
//  Created by Amy Joscelyn on 11/17/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import SpriteKit

extension SKTexture
{
  convenience init(pixelImageNamed: String)
  {
    self.init(imageNamed: pixelImageNamed)
    self.filteringMode = .nearest
  }
}
