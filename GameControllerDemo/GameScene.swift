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
        //Configure the virtual controller. Specify what elements you want to use, buttons, dpads etc.
        let controllerConfig = GCVirtualController.Configuration()
        controllerConfig.elements = [
            GCInputLeftThumbstick,
            GCInputButtonA, GCInputButtonB
        ]
        
        //create a virtual controller
        let controller = GCVirtualController(configuration: controllerConfig)
        controller.connect()
        virtualController = controller

        //in this example we are using handlers to obtain the input from the Dpad and buttons. Alternatively, you could poll for the values every game loop.
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
