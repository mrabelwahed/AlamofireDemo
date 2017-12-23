//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Mahmoud Ramadan on 12/18/17.
//  Copyright © 2017 Mahmoud Ramadan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var dataSet = [[String:AnyObject]]()
    
    var url = "http://api.androidhive.info/contacts/";

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactsTableView.delegate = self
        self.contactsTableView.dataSource = self
        fetchContacts()
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomCell
        var dict = dataSet[indexPath.row]
        cell.nameLabel?.text = dict["name"] as? String
        cell.emailLabel?.text = dict["email"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func fetchContacts(){
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                 print(swiftyJsonVar)
                if let resData = swiftyJsonVar["contacts"].arrayObject{
                    self.dataSet = resData as! [[String:AnyObject]]
                }
                if self.dataSet.count>0{
                    self.contactsTableView.reloadData()
                }
               
            }
        }
    
    }

}

