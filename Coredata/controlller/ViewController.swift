//
//  ViewController.swift
//  Coredata
//
//  Created by comviva on 07/02/22.
//

import UIKit

    class ViewController: UIViewController {
        @IBOutlet weak var tbl:UITableView!
        var emplist:[Employee]=[]
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            print("\(NSHomeDirectory())")
            emplist=getemp()
            tbl.dataSource=self
            tbl.delegate=self
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addclicked))
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteclicked))
            
            
            // Do any additional setup after loading the view.
        }
        
        @objc func deleteclicked(){
            
            deleteemp()
            emplist.removeAll()
            tbl.reloadData()
        }
        @objc func addclicked(){
            let alertVC=UIAlertController(title: "new employee", message: nil, preferredStyle: .alert)
            alertVC.addTextField{(tf)in
                tf.placeholder="enter name"
                
                
            }
            alertVC.addTextField{(tf)in
                tf.placeholder="emp id"
                
            }
            alertVC.addTextField{(tf)in
                tf.placeholder="city"
                
            }
            alertVC.addTextField{(tf)in
                tf.placeholder="salary"
                tf.keyboardType = .numberPad
                
                
            }
            
            let addempction=UIAlertAction(title: "Add", style: .default){_ in
                let nametf=alertVC.textFields?[0].text ?? ""
                let idtf=alertVC.textFields?[1].text ?? ""
                let citytf=alertVC.textFields?[2].text ?? ""
                let salarytf=alertVC.textFields?[3].text ?? ""
                
                
                if !nametf.isEmpty && !idtf.isEmpty && !citytf.isEmpty && !salarytf.isEmpty{
                    if let empid=Int(idtf),let sal=Int(salarytf){
                        addemp(name: nametf, id: empid, salary: sal, city: citytf)
                        self.emplist=getemp()
                        self.tbl.reloadData()
                    }
                    else{
                        print("id and salary only digits")
                    }
                }
                    else{
                        print("all fields nott enterred")
                    }
                

            }
            alertVC.addAction(addempction)
           present(alertVC, animated: false, completion: nil)
//            addemp(name: "ram", id: 1, salary: 100000, city: "lucknow")
//            addemp(name: "shyam", id: 2, salary: 30000, city: "goa")
//            emplist=getemp()
//            tbl.reloadData()
        }
        
        
        
        @IBAction func filtredata(_ sender: Any) {
            
            emplist=getemplfilterbycity(city: "lok")
            tbl.reloadData()
            
        }
        @IBAction func sortdata(_ sender: Any) {
            emplist=getemplsortbysal()
            tbl.reloadData()
        }
        
    }

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emplist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=(tableView.dequeueReusableCell(withIdentifier: "empcell", for: indexPath) as? employeeCell)!
        
        let emp=emplist[indexPath.row]
        cell.nameL.text=emp.empName
        cell.empid.text="\(emp.empid)"
        cell.city.text=emp.city
        cell.salary.text="\(emp.salary)"

        
        return cell
        
    }
    
    
}
    extension ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let emp=emplist[indexPath.row]
    delemp(emptodelete: emp)
            emplist=getemp()
            tbl.reloadData()    }
    }
