//
//  ViewController.swift
//  ARDicee
//
//  Created by Jaime Escobar on 17/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    // MARK: - Variables
    @IBOutlet var sceneView: ARSCNView!
    private var dices = [SCNNode]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    // MARK: - Actions
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        rollAll()
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        if !dices.isEmpty {
            dices.forEach { dice in
                dice.removeFromParentNode()
            }
            dices.removeAll()
        }
    }
    
    func rollAll() {
        if !dices.isEmpty {
            dices.forEach { dice in
                roll(dice: dice)
            }
        }
    }
    
    private func roll(dice: SCNNode) {
        let randomX = Float(arc4random_uniform(4) + 1) * Float.pi/2
        let randomZ = Float(arc4random_uniform(4) + 1) * Float.pi/2
        dice.runAction(
            SCNAction.rotateBy(x: CGFloat(randomX),
                               y: 0,
                               z: CGFloat(randomZ),
                               duration: 0.75))
    }
    
    // MARK: - Overrided actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)
            let results = sceneView.hitTest(location, types: .existingPlaneUsingExtent)
            if let hit = results.first {
                if let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn") {
                    if let diceNode = diceScene.rootNode.childNode(withName: "Dice",
                                                                   recursively: true) {
                        diceNode.position = SCNVector3(hit.worldTransform.columns.3.x,
                                                       hit.worldTransform.columns.3.y,
                                                       hit.worldTransform.columns.3.z)
                        dices.append(diceNode)
                        sceneView.scene.rootNode.addChildNode(diceNode)
                        roll(dice: diceNode)
                    }
                }
            }
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollAll()
    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x),
                                 height: CGFloat(planeAnchor.extent.z))
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(x: planeAnchor.center.x,
                                            y: 0,
                                            z: planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            plane.materials = [gridMaterial]
            planeNode.geometry = plane
            node.addChildNode(planeNode)
        }
    }
}
