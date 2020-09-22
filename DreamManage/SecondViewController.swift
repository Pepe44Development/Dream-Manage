//
//  SecondViewController.swift
//  DreamManage
//
//  Created by Pascal Priessnitz on 15.07.20.
//  Copyright © 2020 Pepe44DEV. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        OnlineWeb()
        OnlineForum()
        OnlineFiveM()
        OnlineTs()
    }

    @IBOutlet weak var web: UILabel!
    
    @IBOutlet weak var forum: UILabel!
    
    @IBOutlet weak var fivem: UILabel!
    
    @IBOutlet weak var ts: UILabel!
    
    
    @IBAction func rfbtn(_ sender: UIButton) {
        OnlineWeb()
        OnlineForum()
        OnlineFiveM()
        OnlineTs()
        
    }
    
    
    
    
    
    
    
    func OnlineWeb() {
          let hostUrl: String = "https://null-point.de"
          if let url = URL(string: hostUrl) {
             var request = URLRequest(url: url)
             request.httpMethod = "HEAD"
             URLSession(configuration: .default)
             .dataTask(with: request) { (_, response, error) -> Void in
                guard error == nil else {
                   print("Error:", error ?? "")
                    self.web.text = "Online"
                    self.web.textColor = UIColor.green
                   return
                }
                guard (response as? HTTPURLResponse)?
                .statusCode == 200 else {
                   DispatchQueue.main.async {
                   self.web.text = "Offline"
                   self.web.textColor = UIColor.red
                   }
                   return
                   
                }
                DispatchQueue.main.async {
               self.web.text = "Online"
               self.web.textColor = UIColor.green
           }
             }
             .resume()
          }
       }
    
    
    
    
    func OnlineForum() {
          let hostUrl: String = "https://null-point.de/woltlab"
          if let url = URL(string: hostUrl) {
             var request = URLRequest(url: url)
             request.httpMethod = "HEAD"
             URLSession(configuration: .default)
             .dataTask(with: request) { (_, response, error) -> Void in
                guard error == nil else {
                   print("Error:", error ?? "")
                    self.forum.text = "Online"
                    self.forum.textColor = UIColor.green
                   return
                }
                guard (response as? HTTPURLResponse)?
                .statusCode == 200 else {
                   DispatchQueue.main.async {
                   self.forum.text = "Offline"
                   self.forum.textColor = UIColor.red
                   }
                   return
                   
                }
                DispatchQueue.main.async {
               self.forum.text = "Online"
               self.forum.textColor = UIColor.green
           }
             }
             .resume()
          }
       }
    
    
    func OnlineFiveM() {
          let hostUrl: String = "https://null-point.de"
          if let url = URL(string: hostUrl) {
             var request = URLRequest(url: url)
             request.httpMethod = "HEAD"
             URLSession(configuration: .default)
             .dataTask(with: request) { (_, response, error) -> Void in
                guard error == nil else {
                   print("Error:", error ?? "")
                    DispatchQueue.main.async {
                    self.fivem.text = "Offline"
                    self.fivem.textColor = UIColor.red
                    }
                   return
                }
                guard (response as? HTTPURLResponse)?
                .statusCode == 200 else {
                   DispatchQueue.main.async {
                   self.fivem.text = "Offline"
                   self.fivem.textColor = UIColor.red
                   }
                   return
                   
                }
                DispatchQueue.main.async {
               self.fivem.text = "Online"
               self.fivem.textColor = UIColor.green
           }
             }
             .resume()
          }
       }
    
    
    func OnlineTs() {
          let hostUrl: String = "https://null-point.de"
          if let url = URL(string: hostUrl) {
             var request = URLRequest(url: url)
             request.httpMethod = "HEAD"
             URLSession(configuration: .default)
             .dataTask(with: request) { (_, response, error) -> Void in
                guard error == nil else {
                   print("Error:", error ?? "")
                    DispatchQueue.main.async{
                    self.ts.text = "Offline"
                    self.ts.textColor = UIColor.red
                    }
                   return
                }
                guard (response as? HTTPURLResponse)?
                .statusCode == 200 else {
                   DispatchQueue.main.async {
                   self.ts.text = "Offline"
                   self.ts.textColor = UIColor.red
                   }
                   return
                   
                }
                DispatchQueue.main.async {
               self.ts.text = "Online"
               self.ts.textColor = UIColor.green
           }
             }
             .resume()
          }
       }
    
    
    
    
    
    

}

