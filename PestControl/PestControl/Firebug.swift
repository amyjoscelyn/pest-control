//
//  Firebug.swift
//  PestControl
//
//  Created by Amy Joscelyn on 11/29/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import SpriteKit

class Firebug: Bug
{
  required init?(coder aDecoder: NSCoder)
  {
    fatalError()
  }
  
  override init()
  {
    super.init()
    name = "Firebug"
    color = .red
    colorBlendFactor = 0.8
    physicsBody?.categoryBitMask = PhysicsCategory.Firebug
  }
}
