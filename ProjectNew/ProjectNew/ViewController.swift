//
//  ViewController.swift
//  ProjectNew
//
//  Created by Lai Minh on 6/9/19.
//  Copyright © 2019 LaiMinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    
    var arr:[SinhVien] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
       
        let url = URL(string: "http://192.168.22.11:3000")
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url!) { (dt:Data?, ur:URLResponse?, e:Error?) in
            
            DispatchQueue.main.async {
                
                
                do{
                    let json = try JSONDecoder.init().decode(DULIEU.self, from: dt!)
                    self.arr = json.sv
                    self.tableView.reloadData()
                    
                    
                }catch{
                    print("errors")
                }
                
            }
            
        }
        task.resume()
        
        
        
        
    
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
        cell.lblHOTEN.text = arr[indexPath.row].HOTEN
        cell.lblNAMSINH.text = String(arr[indexPath.row].NAMSINH)
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}



struct  DULIEU:Codable {
    var sv:[SinhVien]
}
struct SinhVien:Codable {
    var HOTEN:String
    var  NAMSINH:Int
    
}
