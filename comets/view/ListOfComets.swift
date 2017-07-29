//
//  ListOfComets.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import UIKit
import RealmSwift

class ListOfComets: UITableViewController {

    private let cometManager = CometManager()
    private var data:Results<Comet>? {
        didSet
        {
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sinc = Syncronize();
        sinc.delegate = cometManager
        sinc.call()
        
        
        self.clearsSelectionOnViewWillAppear = false
        
         NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: ThreadNotifications.dataReady), object: nil, queue: nil, using: self.receive)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func receive(notification:Notification)
    {
        if notification.name == Notification.Name(rawValue:ThreadNotifications.dataReady)
        {
            self.data = cometManager.getData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: constants.cellIdentifier, for: indexPath) as? CometTableViewCell
    
        if cell == nil
        {
            cell = CometTableViewCell(style: .default, reuseIdentifier: constants.cellIdentifier)
        }
        
        cell?.setData(comet:self.data![indexPath.row]);
    
        return cell!
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: constants.detailsSegue, sender: self)
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == constants.detailsSegue)
        {
            if segue.destination is CometDetail
            {
                let cometDetails = segue.destination as! CometDetail
                
                if let selectedIndex = tableView.indexPathForSelectedRow
                {
//                     cometDetails.comet = self.data![selectedIndex.row]
                }
                
               
            }
        }

    }
    

}



struct constants {
    static let cellIdentifier = "Cell"
    static let detailsSegue = "details"
}
