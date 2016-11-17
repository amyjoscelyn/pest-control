//
//  Bug.swift
//  PestControl
//
//  Created by Amy Joscelyn on 11/17/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import SpriteKit

class Bug: SKSpriteNode
{
  required init?(coder aDecoder: NSCoder)
  {
    fatalError("Use init()")
  }
  
  init()
  {
    let texture = SKTexture(pixelImageNamed: "bug_ft1")
    super.init(texture: texture, color: .white, size: texture.size())
    name = "Bug"
    zPosition = 50
    
    physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
    physicsBody?.restitution = 0.5
    physicsBody?.allowsRotation = false
  }
}
