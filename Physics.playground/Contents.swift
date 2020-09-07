//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import CoreGraphics

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 480,
  height: 320))
let scene = SKScene(size: CGSize(width: 480, height: 320))

let square = SKSpriteNode(imageNamed: "square")
square.name = "shape"
square.position = CGPoint(x: scene.size.width*0.25, y: scene.size.height*0.5)
square.physicsBody = SKPhysicsBody(rectangleOf: square.frame.size)

let circle = SKSpriteNode(imageNamed: "circle")
circle.name = "shape"
circle.position = CGPoint(x: scene.size.width*0.5, y: scene.size.height*0.5)
circle.physicsBody = SKPhysicsBody(circleOfRadius: circle.size.width/2)

let triangle = SKSpriteNode(imageNamed: "triangle")
triangle.name = "shape"
triangle.position = CGPoint(x: scene.size.width*0.75, y: scene.size.height*0.5)

let l = SKSpriteNode(imageNamed: "L")
l.name = "shape"
l.position = CGPoint(x: scene.size.width * 0.5,
  y: scene.size.height * 0.75)
l.physicsBody = SKPhysicsBody(texture: l.texture!, size: l.size)
scene.addChild(l)


scene.addChild(square)
scene.addChild(circle)
scene.addChild(triangle)

func createSandParticles() {
  let sand = SKSpriteNode(imageNamed: "sand")
  sand.position = CGPoint(
    x: random(min: 0.0, max: scene.size.width),
    y: scene.size.height - sand.size.height)
  sand.physicsBody = SKPhysicsBody(circleOfRadius:
    sand.size.width/2)
  sand.name = "sand"
//    sand.physicsBody?.restitution = 1.0
//    sand.physicsBody?.density = 20.0
  scene.addChild(sand)
}


scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.frame)
scene.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
//Setting Gravity after 2 seconds delay
delay(seconds: 2.0) {
    scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
    scene.run(
        SKAction.repeat(
            SKAction.sequence([
                SKAction.run(createSandParticles),
                SKAction.wait(forDuration: 0.1)
            ])
            , count: 100)
    )
}

sceneView.showsFPS = true
sceneView.showsPhysics = true
sceneView.presentScene(scene)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = sceneView


