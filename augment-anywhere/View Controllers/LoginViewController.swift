//
//  LoginViewController.swift
//  augment-anywhere
//
//  Created by zach on 4/13/19.
//  Copyright © 2019 zach. All rights reserved.
//

import UIKit
import PureLayout
import SwiftyJSON
import ARKit

class LoginViewController: UIViewController {
    
    var loginButton: UIButton = UIButton()
    var backgroundImage: UIImageView = UIImageView()
    var sharedInstance = ConnectionHandler.sharedInstance
    let screenSize = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("loginvc did load")

        setupUI()
        setupActions()
    }
    
    func setupUI() {
        
        print("loginvc setupui")
        
        // setup background image
        backgroundImage.backgroundColor = UIColor.black
        backgroundImage.autoSetDimension(.height, toSize: 100)
        backgroundImage.autoSetDimension(.width, toSize: 100)
        view?.addSubview(backgroundImage)
        backgroundImage.autoCenterInSuperview()
        
        // setup login button
        loginButton.backgroundColor = UIColor.gray
        loginButton.autoSetDimension(.height, toSize: 100)
        loginButton.autoSetDimension(.width, toSize: 300)
        view?.addSubview(loginButton)
        loginButton.autoPinEdge(.top, to: .bottom, of: backgroundImage, withOffset: 20)
    }
    
    func setupActions() {
        print("loginvc setupactions")
        loginButton.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
    }
    
    @objc func tryLogin() {
        print("try login")

//        // encode anchor to base64 and send it over websocket
//        let image = UIImage(named: "bitcamp")
//        let imageData = image!.pngData()
//        let strBase64 = imageData?.base64EncodedString()
        
        let cubeScene: CubeScene = CubeScene(json: JSON(), name: "0")
        cubeScene.buildScene()
        
        // navigate to viewcontroller
        self.performSegue(withIdentifier: "ar", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
