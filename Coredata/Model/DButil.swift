//
//  DButil.swift
//  Coredata
//
//  Created by comviva on 07/02/22.
//

import Foundation
import UIKit
import CoreData
//managed object context

let MOContext=((UIApplication.shared.delegate as?
               AppDelegate)?.persistentContainer.viewContext)!



func addemp(name:String,id:Int,salary:Int,city:String){
   let emp=Employee(context: MOContext)
    emp.empid=Int64(id)
    emp.empName=name
    emp.city=city
    emp.salary=Int64(salary)
    do{
    try  MOContext.save()
        print("inserted new employee")
    }catch{
        print("unable to save\(error.localizedDescription)")
        MOContext.delete(emp)
    }
}

func getemplsortbyname()->[Employee]{
    
    
    var elist:[Employee]=[]
    let frequest:NSFetchRequest<Employee>=Employee.fetchRequest()
    let namesort=NSSortDescriptor(key: "empName", ascending: true)
    frequest.sortDescriptors=[namesort]
    do{
        elist=try MOContext.fetch(frequest)
        print("sort done")
    }catch{
        print("errror:::----\(error.localizedDescription)")
    }
                                  
       return elist
}
func getemplsortbysal()->[Employee]{
    
    
    var elist:[Employee]=[]
    let frequest:NSFetchRequest<Employee>=Employee.fetchRequest()
    let namesort=NSSortDescriptor(key: "salary", ascending: false)
    frequest.sortDescriptors=[namesort]
    do{
        elist=try MOContext.fetch(frequest)
        print("sort done")
    }catch{
        print("errror:::----\(error.localizedDescription)")
    }
                                  
       return elist
}
func getemplfilterbycity(city:String)->[Employee]{
    
    
    var elist:[Employee]=[]
    let frequest:NSFetchRequest<Employee>=Employee.fetchRequest()
    let citypredicate=NSPredicate(format: "city==%@",city)
    frequest.predicate=citypredicate
    do{
        elist=try MOContext.fetch(frequest)
        print("sort done")
    }catch{
        print("errror:::----\(error.localizedDescription)")
    }
                                  
       return elist
}

func getemp()->[Employee]{
    
    var emplist:[Employee]=[]
    let frequest:NSFetchRequest<Employee>=Employee.fetchRequest()
    do{
   emplist=try MOContext.fetch(frequest)
        print("fetched\(emplist.count)")
        
    }catch{
        
        print("\(error.localizedDescription)")
       
    }
    return emplist
}



func delemp(emptodelete:Employee){
    MOContext.delete(emptodelete)
    do{
   try  MOContext.save()
        print("deleted employee:--\(emptodelete.empName ?? "")")
        
    }catch{
        print("unable ti delete emp:-- \(error.localizedDescription)")
        
        
        
    }
}
func deleteemp(){
    
    let empdel=getemp()
    for emp in empdel{
        (delemp(emptodelete: emp))
        
    }
    
    
}
