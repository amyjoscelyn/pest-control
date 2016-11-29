//
//  Player.swift
//  PestControl
//
//  Created by Amy Joscelyn on 11/16/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import SpriteKit

enum PlayerSettings
{
  static let playerSpeed: CGFloat = 280.0
}

class Player: SKSpriteNode
{
  var animations: [SKAction] = []
  var hasBugspray: Bool = false {
    didSet {
      blink(color: .green, on: hasBugspray)
    }
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    fatalError("Use init()")
  }
  
  init()
  {
    let texture = SKTexture(pixelImageNamed: "player_ft1")
    super.init(texture: texture, color: .white, size: texture.size())
    name = "Player"
    zPosition = 50
    
    physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
    physicsBody?.restitution = 1.0
    physicsBody?.linearDamping = 0.5
    physicsBody?.friction = 0
    physicsBody?.allowsRotation = false
    physicsBody?.categoryBitMask = PhysicsCategory.Player
    physicsBody?.contactTestBitMask = PhysicsCategory.All
    
    createAnimations(character: "player")
  }
  
  func move(target: CGPoint)
  {
    guard let physicsBody = physicsBody else { return }
    
    let newVelocity = (target - position).normalized() * PlayerSettings.playerSpeed
    physicsBody.velocity = CGVector(point: newVelocity)
    
    checkDirection()
  }
  
  func checkDirection()
  {
    guard let physicsBody = physicsBody else { return }
    
    let direction = animationDirection(for: physicsBody.velocity)
    
    if direction == .left
    {
      xScale = abs(xScale)
    }
    if direction == .right
    {
      xScale = -abs(xScale)
    }
    run(animations[direction.rawValue], withKey: "animation")
  }
  
  func blink(color: SKColor, on: Bool)
  {
    let blinkOff = SKAction.colorize(withColorBlendFactor: 0.0, duration: 0.2)
    
    if on
    {
      let blinkOn = SKAction.colorize(with: color,
                                      colorBlendFactor: 1.0,
                                      duration: 0.2)
      let blink = SKAction.repeatForever(SKAction.sequence([blinkOn, blinkOff]))
      xScale = xScale < 0 ? -1.5 : 1.5
      yScale = 1.5
      run(blink, withKey: "blink")
    }
    else
    {
      xScale = xScale < 0 ? -1.0 : 1.0
      yScale = 1.0
      removeAction(forKey: "blink")
      run(blinkOff)
    }
  }
}

extension Player : Animatable {}
