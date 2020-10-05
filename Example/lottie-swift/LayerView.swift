//
//  LayerView.swift
//  Exported from Kite Compositor for Mac 2.0.2
//
//  Created on 10/5/20, 9:41 AM.
//


import UIKit

class LayerView: UIView
{

    // MARK: - Initialization

    init()
    {
        super.init(frame: CGRect(x: 0, y: 0, width: 375, height: 300))
        self.setupLayers()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setupLayers()
    }

    // MARK: - Setup Layers

    private func setupLayers()
    {
        // Colors
        //
        let backgroundColor = UIColor.black
        let borderColor = UIColor(red: 0.8305, green: 0.88, blue: 0.2464, alpha: 1)

        // Layer
        //
        let layerLayer = CALayer()
        layerLayer.name = "Layer"
        layerLayer.bounds = CGRect(x: 0, y: 0, width: 75, height: 75)
        layerLayer.position = CGPoint(x: 50, y: 100)
        layerLayer.anchorPoint = CGPoint(x: 0, y: 0)
        layerLayer.contentsGravity = .center
        layerLayer.backgroundColor = backgroundColor.cgColor
        layerLayer.cornerRadius = 37.5
        layerLayer.borderWidth = 1
        layerLayer.borderColor = borderColor.cgColor
        layerLayer.shadowOffset = CGSize(width: 0, height: 1)
        layerLayer.allowsEdgeAntialiasing = true
        layerLayer.allowsGroupOpacity = true
        layerLayer.fillMode = .forwards

            // Layer Animations
            //

            // position.y
            //
            let positionYAnimation = CAKeyframeAnimation()
            positionYAnimation.beginTime = self.layer.convertTime(CACurrentMediaTime(), from: nil) + 0.005002
            positionYAnimation.duration = 0.965432
            positionYAnimation.repeatCount = 100
            positionYAnimation.fillMode = .forwards
            positionYAnimation.isRemovedOnCompletion = false
            positionYAnimation.keyPath = "position.y"
            positionYAnimation.values = [ 100, 50, 150, 100 ]
            positionYAnimation.keyTimes = [ 0, 0.25, 0.76, 1 ]
            positionYAnimation.calculationMode = .paced

            layerLayer.add(positionYAnimation, forKey: "positionYAnimation")

        self.layer.addSublayer(layerLayer)

        // Layer
        //
        let layerLayer1 = CALayer()
        layerLayer1.name = "Layer"
        layerLayer1.bounds = CGRect(x: 0, y: 0, width: 75, height: 75)
        layerLayer1.position = CGPoint(x: 150, y: 100)
        layerLayer1.anchorPoint = CGPoint(x: 0, y: 0)
        layerLayer1.contentsGravity = .center
        layerLayer1.backgroundColor = backgroundColor.cgColor
        layerLayer1.cornerRadius = 37.5
        layerLayer1.borderWidth = 1
        layerLayer1.borderColor = borderColor.cgColor
        layerLayer1.shadowOffset = CGSize(width: 0, height: 1)
        layerLayer1.allowsEdgeAntialiasing = true
        layerLayer1.allowsGroupOpacity = true
        layerLayer1.fillMode = .forwards

            // Layer Animations
            //

            // position.y
            //
            let positionYAnimation1 = CAKeyframeAnimation()
            positionYAnimation1.beginTime = self.layer.convertTime(CACurrentMediaTime(), from: nil) + -0.206192
            positionYAnimation1.duration = 0.965432
            positionYAnimation1.repeatCount = 100
            positionYAnimation1.fillMode = .forwards
            positionYAnimation1.isRemovedOnCompletion = false
            positionYAnimation1.keyPath = "position.y"
            positionYAnimation1.values = [ 100, 50, 150, 100 ]
            positionYAnimation1.keyTimes = [ 0, 0.25, 0.76, 1 ]
            positionYAnimation1.calculationMode = .paced

            layerLayer1.add(positionYAnimation1, forKey: "positionYAnimation1")

        self.layer.addSublayer(layerLayer1)

        // Layer
        //
        let layerLayer2 = CALayer()
        layerLayer2.name = "Layer"
        layerLayer2.bounds = CGRect(x: 0, y: 0, width: 75, height: 75)
        layerLayer2.position = CGPoint(x: 250, y: 100)
        layerLayer2.anchorPoint = CGPoint(x: 0, y: 0)
        layerLayer2.contentsGravity = .center
        layerLayer2.backgroundColor = backgroundColor.cgColor
        layerLayer2.cornerRadius = 37.5
        layerLayer2.borderWidth = 1
        layerLayer2.borderColor = borderColor.cgColor
        layerLayer2.shadowOffset = CGSize(width: 0, height: 1)
        layerLayer2.allowsEdgeAntialiasing = true
        layerLayer2.allowsGroupOpacity = true
        layerLayer2.fillMode = .forwards

            // Layer Animations
            //

            // position.y
            //
            let positionYAnimation2 = CAKeyframeAnimation()
            positionYAnimation2.beginTime = self.layer.convertTime(CACurrentMediaTime(), from: nil) + -0.477716
            positionYAnimation2.duration = 0.965432
            positionYAnimation2.repeatCount = 100
            positionYAnimation2.fillMode = .forwards
            positionYAnimation2.isRemovedOnCompletion = false
            positionYAnimation2.keyPath = "position.y"
            positionYAnimation2.values = [ 100, 50, 150, 100 ]
            positionYAnimation2.keyTimes = [ 0, 0.25, 0.76, 1 ]
            positionYAnimation2.calculationMode = .paced

            layerLayer2.add(positionYAnimation2, forKey: "positionYAnimation2")

        self.layer.addSublayer(layerLayer2)

    }

    // MARK: - Responder

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let location = touches.first?.location(in: self.superview),
              let hitLayer = self.layer.presentation()?.hitTest(location) else { return }

        print("Layer \(hitLayer.name ?? String(describing: hitLayer)) was tapped.")
    }
}
