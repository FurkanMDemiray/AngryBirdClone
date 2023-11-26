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
        bird.physicsBody?.affectedByGravity = true
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.1



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

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }


    override func update(_ currentTime: TimeInterval) {

    }
}
