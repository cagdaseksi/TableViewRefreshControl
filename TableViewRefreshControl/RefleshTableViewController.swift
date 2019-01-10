//
//  RefleshTableViewController.swift
//  TableViewRefreshControl
//
//  Created by MAC on 10/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class RefleshTableViewController: UITableViewController {

    var array:[Int] = [1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3,1, 2, 3]
    var refresher: UIRefreshControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(RefleshTableViewController.populate), for: UIControl.Event.valueChanged)
        tableView.addSubview(refresher)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         print("running willDisplay")
        //populate()
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
         print("didEndDisplayingHeaderView")
    }
    
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //self.tableView(tableView, willDisplayMyCell: cell as! UITableViewCell, forRowAtIndexPath: indexPath)
        print("willDisplayCell")
    }

    @objc func populate()
    {
        print("populate")
        for i in 1...100
        {
            array.append(i)
        }
        
        tableView.reloadData()
        refresher.endRefreshing()
    }
    
}
