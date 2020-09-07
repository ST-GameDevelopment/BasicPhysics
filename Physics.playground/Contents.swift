//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 480,
  height: 320))
let scene = SKScene(size: CGSize(width: 480, height: 320))

let square = SKSpriteNode(imageNamed: "square")
square.name = "shape"
square.position = CGPoint(x: scene.size.width*0.25, y: scene.size.height*0.5)

let circle = SKSpriteNode(imageNamed: "circle")
circle.name = "shape"
circle.position = CGPoint(x: scene.size.width*0.5, y: scene.size.height*0.5)

let triangle = SKSpriteNode(imageNamed: "triangle")
triangle.name = "shape"
triangle.position = CGPoint(x: scene.size.width*0.75, y: scene.size.height*0.5)

scene.addChild(square)
scene.addChild(circle)
scene.addChild(triangle)


sceneView.showsFPS = true
sceneView.presentScene(scene)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = sceneView

