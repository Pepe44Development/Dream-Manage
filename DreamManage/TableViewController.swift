//
//  TableViewController.swift
//  DreamManage
//
//  Created by Pascal Priessnitz on 21.09.20.
//  Copyright © 2020 Pepe44DEV. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var players = [Players]()
    var rrefreshControl : UIRefreshControl = UIRefreshControl()
    @IBOutlet var refresh: UIScreenEdgePanGestureRecognizer?
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        update()
        
        rrefreshControl.attributedTitle = NSAttributedString(attributedString: NSAttributedString(string: "Pull to refresh"))
        rrefreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
           tableView.addSubview(rrefreshControl)
    }
            
            
    @objc func refresh(_ sender: AnyObject) {
        update()
        
    }
            
        
    func update() {
        let url = URL(string:"http://dream-city.net:30120/players.json")!
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                debugPrint("Fehler beim Laden", error ?? "Unbekannter Fehler")
                return
            }
            print(data)
            self.players = try! JSONDecoder().decode([Players].self, from: data)
            print(self.players)
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
                if(self.rrefreshControl.isRefreshing) {
                    self.rrefreshControl.endRefreshing()
                }
                
            }
            
        }
        task.resume();
    }
    



    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return self.players.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersCell", for: indexPath)
        
        
        let player = self.players[indexPath.row]
        cell.textLabel?.text = player.name + " (" + String(player.id) + ")"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = self.players[indexPath.row]
        var str : String
        str = ""
        for ident in player.identifiers {
            str = str + ident + "\n"
        }
        var name : String = player.name
        name = name + " (" + String(player.id) + ")"
        
        let alert = UIAlertController(title: name, message: str, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in NSLog("OK")}))
        self.present(alert, animated: true, completion: {})
    }
    

}
