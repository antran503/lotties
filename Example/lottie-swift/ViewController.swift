//
//  ViewController.swift
//  lottie-swift
//
//  Created by buba447 on 01/07/2019.
//  Copyright (c) 2019 buba447. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
  let animationView = AnimationView()
  let coreAnimationView = UIView()
  let coreAnimationViewContainer = UIView()
//  let slider = UISlider()
  let sleepButton = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let animation = Animation.named("loading_dots", subdirectory: "TestAnimations")
    
    animationView.animation = animation
    animationView.contentMode = .scaleAspectFit
    view.addSubview(animationView)

    view.addSubview(sleepButton)
    sleepButton.translatesAutoresizingMaskIntoConstraints = false

    coreAnimationViewContainer.translatesAutoresizingMaskIntoConstraints = false
    coreAnimationView.translatesAutoresizingMaskIntoConstraints = false
    coreAnimationViewContainer.addSubview(coreAnimationView)
    view.addSubview(coreAnimationViewContainer)

    /// Lottie Animation

//    view.addSubview(slider)
    animationView.backgroundBehavior = .pauseAndRestore
    animationView.translatesAutoresizingMaskIntoConstraints = false
    animationView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    animationView.bottomAnchor.constraint(equalTo: coreAnimationViewContainer.topAnchor, constant: -12).isActive = true
    animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    animationView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
    
    /// *** Keypath Setting

    let ellipseFill = "Ellipse 1.Fill 1.Color"
    animationView.setValueProvider(
      ColorValueProvider(UIColor.red.lottieColorValue),
      keypath: AnimationKeypath(keypath: "1.\(ellipseFill)"))
    animationView.setValueProvider(
      ColorValueProvider(UIColor.red.lottieColorValue),
      keypath: AnimationKeypath(keypath: "2.\(ellipseFill)"))
    animationView.setValueProvider(
      ColorValueProvider(UIColor.red.lottieColorValue),
      keypath: AnimationKeypath(keypath: "3.\(ellipseFill)"))

    /// Core Animation

    coreAnimationViewContainer.heightAnchor.constraint(equalTo: animationView.heightAnchor).isActive = true
    coreAnimationViewContainer.bottomAnchor.constraint(equalTo: sleepButton.topAnchor, constant: -12).isActive = true
    coreAnimationViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    coreAnimationViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    coreAnimationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    coreAnimationView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    coreAnimationView.centerYAnchor.constraint(equalTo: coreAnimationViewContainer.centerYAnchor).isActive = true
    let centerX = coreAnimationView.centerXAnchor.constraint(equalTo: coreAnimationViewContainer.centerXAnchor, constant: -50)
    coreAnimationView.backgroundColor = .blue
    coreAnimationView.layer.cornerRadius = 25
    centerX.isActive = true

    view.layoutIfNeeded()

    UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [.repeat, .calculationModeLinear], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
        centerX.constant = 50
        self.view.layoutIfNeeded()
      }
      UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
        centerX.constant = -50
        self.view.layoutIfNeeded()
      }
    })

    /// Button

    sleepButton.setTitle("Sleep for 1 second", for: .normal)
    sleepButton.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
    sleepButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    sleepButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
    sleepButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -12).isActive = true


    /// Play Animation
    
    /// Create a display link to make slider track with animation progress.
//    displayLink = CADisplayLink(target: self, selector: #selector(animationCallback))
//    displayLink?.add(to: .current,
//                    forMode: RunLoop.Mode.default)
//
    
    /// Animated Switch
    
    /*
    let switchButton = AnimatedSwitch()
    switchButton.animation = Animation.named("Switch", subdirectory: "TestAnimations")
    switchButton.translatesAutoresizingMaskIntoConstraints = false

    /// Set the play progress for `On` and `Off`
    switchButton.setProgressForState(fromProgress: 0.5, toProgress: 1, forOnState: true)
    switchButton.setProgressForState(fromProgress: 0, toProgress: 0.5, forOnState: false)

    view.addSubview(switchButton)

    switchButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12).isActive = true
    switchButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20).isActive = true
    */

    /// Animated Button
    
    /*
    let twitterButton = AnimatedButton()
    twitterButton.translatesAutoresizingMaskIntoConstraints = false
    /// Set an animation on the button.
    twitterButton.animation = Animation.named("TwitterHeartButton", subdirectory: "TestAnimations")
    /// Turn off clips to bounds, as the animation goes outside of the bounds.
    twitterButton.clipsToBounds = false
    /// Set animation play ranges for touch states
    twitterButton.setPlayRange(fromMarker: "touchDownStart", toMarker: "touchDownEnd", event: .touchDown)
    twitterButton.setPlayRange(fromMarker: "touchDownEnd", toMarker: "touchUpCancel", event: .touchUpOutside)
    twitterButton.setPlayRange(fromMarker: "touchDownEnd", toMarker: "touchUpEnd", event: .touchUpInside)
    view.addSubview(twitterButton)

    twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 12).isActive = true
    twitterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
    */
//    view.backgroundColor = UIColor.black
//    let keypath1 = AnimationKeypath(keypath: "**.eyes_*")
//    let keypath2 = AnimationKeypath(keypath: "**.head_*")
//
//    let keypath3 = AnimationKeypath(keypath: "**.head_006")
//    let keypath4 = AnimationKeypath(keypath: "**.eyes_002")
//
//
//    animationView.setNodeIsEnabled(isEnabled: false, keypath: keypath1)
//    animationView.setNodeIsEnabled(isEnabled: false, keypath: keypath2)
//    animationView.setNodeIsEnabled(isEnabled: true, keypath: keypath3)
//    animationView.setNodeIsEnabled(isEnabled: true, keypath: keypath4)
    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//      print("Disabling group 1")
//      self.animationView.setNodeIsEnabled(isEnabled: false, keypath: keypath4)
//      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//        print("Enabling group 1")
//        self.animationView.setNodeIsEnabled(isEnabled: true, keypath: keypath4)
//
//      }
//    }
  }
  
  var displayLink: CADisplayLink?
  
  @objc func updateAnimation(sender: UISlider) {
    animationView.currentProgress = CGFloat(sender.value)
  }

  @objc func tapped(sender: UIButton) {
    // Block the main thread for 1 second
    sleep(1)
  }
  
  @objc func sliderFinished() {
//    animationView.play(fromProgress: 0,
//                       toProgress: 1,
//                       loopMode: LottieLoopMode.playOnce,
//                       completion: { (finished) in
//                        if finished {
//                          print("Animation Complete")
//                        } else {
//                          print("Animation cancelled")
//                        }
//    })
  }
  
  @objc func animationCallback() {
//    if animationView.isAnimationPlaying {
//      slider.value = Float(animationView.realtimeAnimationProgress)
//    }
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    animationView.play(fromProgress: 0,
                       toProgress: 1,
                       loopMode: LottieLoopMode.repeat(1000),
                       completion: { (finished) in
                        if finished {
                          print("Animation Complete")
                        } else {
                          print("Animation cancelled")
                        }
    })
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
    // Dispose of any resources that can be recreated.
  }
  
}
