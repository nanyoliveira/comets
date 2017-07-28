//
//  ListOfComets.swift
//  comets
//
//  Created by Matt Ariane Clarke on 28/07/2017.
//  Copyright © 2017 MN MobileDevelopers. All rights reserved.
//

import UIKit

class ListOfComets: UITableViewController {

    private let cometManager = CometManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sinc = Syncronize();
        sinc.delegate = cometManager
        sinc.call()
        
        
        tableView.register(CometTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.clearsSelectionOnViewWillAppear = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CometTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CometTableViewCell
//        cell.setData();
        

        return cell
    }
 

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
