//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Melik Demiray on 26.11.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var bird = SKSpriteNode()
    var boxs = [SKSpriteNode]()
    var isGameStarted = false
    var startPosition: CGPoint?

    override func didMove(to view: SKView) {
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird.texture = texture
        bird.size = CGSize(width: self.frame.width / 15, height: self.frame.height / 8)
        bird.position = CGPoint(x: 0, y: 0)
        bird.zPosition = 1
        self.addChild(bird)
         */

        // Physics
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit


        // bird
        bird = childNode(withName: "bird") as! SKSpriteNode
        let birdTexture = SKTexture(imageNamed: "bird")

        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.1
        startPosition = bird.position



        // bricks

        let brickTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: brickTexture.size().width / 6, height: brickTexture.size().height / 6)

        for i in 0...5 {
            if let box = childNode(withName: "box\(i)") as? SKSpriteNode {
                boxs.append(box)
                boxs[i].texture = brickTexture
                boxs[i].physicsBody = SKPhysicsBody(rectangleOf: size)
                boxs[i].physicsBody?.affectedByGravity = true
                boxs[i].physicsBody?.isDynamic = true
                boxs[i].physicsBody?.mass = 0.1
                boxs[i].physicsBody?.allowsRotation = true
            } else {
                print("Box with name 'box\(i)' not found.")
            }
        }




    }


    func touchDown(atPoint pos: CGPoint) {


    }

    func touchMoved(toPoint pos: CGPoint) {


    }

    func touchUp(atPoint pos: CGPoint) {

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if isGameStarted == false {

            if let touch = touches.first {

                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)

                if touchNodes.isEmpty == false {

                    for node in touchNodes {

                        if let sprite = node as? SKSpriteNode {

                            if sprite == bird {

                                bird.position = touchLocation

                            }

                        }

                    }

                }

            }

        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameStarted == false {

            if let touch = touches.first {

                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)

                if touchNodes.isEmpty == false {

                    for node in touchNodes {

                        if let sprite = node as? SKSpriteNode {

                            if sprite == bird {

                                bird.position = touchLocation

                            }

                        }

                    }

                }

            }

        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameStarted == false {

            if let touch = touches.first {

                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)

                if touchNodes.isEmpty == false {

                    for node in touchNodes {

                        if let sprite = node as? SKSpriteNode {

                            if sprite == bird {

                                isGameStarted = true
                                bird.physicsBody?.affectedByGravity = true

                                var dx = -(touchLocation.x - startPosition!.x)
                                var dy = -(touchLocation.y - startPosition!.y)

                                bird.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))


                            }

                        }

                    }

                }

            }

        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }


    override func update(_ currentTime: TimeInterval) {

    }
}
