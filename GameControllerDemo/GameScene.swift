//
//  GameScene.swift
//  GameControllerDemo
//
//  Created by Brendan Miller on 2022-06-05.
//

import SpriteKit
import GameplayKit
import GameController

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    


    
    var virtualController: GCVirtualController?
    
    override func sceneDidLoad() {


                
        connectVirtualController()
    }
    
    

    
    

    
    func connectVirtualController(){
        let controllerConfig = GCVirtualController.Configuration()
        controllerConfig.elements = [
            GCInputLeftThumbstick,
            GCInputButtonA, GCInputButtonB
        ]
        let controller = GCVirtualController(configuration: controllerConfig)
        controller.connect()
        virtualController = controller

        //var regController = virtualController.controller
        if let gamePad = virtualController?.controller?.extendedGamepad {
            
            gamePad.leftThumbstick.valueChangedHandler = thumbstickHandler
            gamePad.buttonA.valueChangedHandler = buttonAHandler
            gamePad.buttonB.valueChangedHandler = buttonBHandler
        }
        

        
    }
    

    
    let thumbstickHandler: GCControllerDirectionPadValueChangedHandler = { dPad, xValue, yValue in
        print("DPAD is working!! x= \(xValue) and y=\(yValue)")
    }
    
    let buttonAHandler: GCControllerButtonValueChangedHandler = {aButton, pressure, hasBeenPressed in
        print("A BUTTON IS WORKING!!")
    }
    
    let buttonBHandler: GCControllerButtonValueChangedHandler = {bButton, pressure, hasBeenPressed in
        print("B BUTTON IS WORKING!!")
    }
}
