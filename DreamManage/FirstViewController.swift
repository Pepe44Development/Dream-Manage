//
//  FirstViewController.swift
//  DreamManage
//
//  Created by Pascal Priessnitz on 15.07.20.
//  Copyright © 2020 Pepe44DEV. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var StateL: UILabel!
    

    
    
    
    override func viewDidLoad() {
        OnlineCheck()
        super.viewDidLoad()
    }

//buttons
    
    @IBAction func btn(_ sender: UIButton) {
        startTX()
    }
    
    @IBAction func tsbtn(_ sender: UIButton) {
        startTS()
    }
    
    
    @IBAction func rfbtn(_ sender: UIButton) {
        OnlineCheck()
    }
    
    
    @IBAction func restartbtn(_ sender: UIButton) {
        restart()
    }
    
   
    
    
    
    //ssh Funcs
    func startTX(){
        
        let shortcut = "shortcuts://run-shortcut?name=Tx"
        let url = URL(string: shortcut)!
         
        UIApplication.shared.open(url,
                                  options: [:],
                                  completionHandler: nil)
    }
    
    
    
    func startTS(){
        
        let shortcut = "shortcuts://run-shortcut?name=TS"
        let url = URL(string: shortcut)!
         
        UIApplication.shared.open(url,
                                  options: [:],
                                  completionHandler: nil)
    
    }
    
    
    
    
    func restart(){
        let shortcut = "shortcuts://run-shortcut?name=restart"
        let url = URL(string: shortcut)!
        
        UIApplication.shared.open(url,
                                  options: [:],
                                  completionHandler: nil)
        
    }
    
    
    

    
    func OnlineCheck() {
       let hostUrl: String = "https://null-point.de"
       if let url = URL(string: hostUrl) {
          var request = URLRequest(url: url)
          request.httpMethod = "HEAD"
          URLSession(configuration: .default)
          .dataTask(with: request) { (_, response, error) -> Void in
             guard error == nil else {
                print("Error:", error ?? "")
                return
             }
             guard (response as? HTTPURLResponse)?
             .statusCode == 200 else {
                DispatchQueue.main.async {
                self.StateL.text = "Offline"
                self.StateL.textColor = UIColor.red
                }
                return
                
             }
             DispatchQueue.main.async {
            self.StateL.text = "Online"
            self.StateL.textColor = UIColor.green
        }
          }
          .resume()
       }
    }
    
    
    
    
    

}

