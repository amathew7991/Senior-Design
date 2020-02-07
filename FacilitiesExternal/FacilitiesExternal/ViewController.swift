//
//  ViewController.swift
//  FacilitiesExternal
//
//  Created by Andrea Mathew on 1/4/20.
//  Copyright © 2020 Andrea Mathew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Setting up connection
        let getTicketEndpont: String = "https://modular-ground-255216.appspot.com/get_tickets"
        guard let url = URL(string: getTicketEndpont) else {
          print("Error: cannot create URL")
          return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared

        let task = session.dataTask(with: urlRequest) {
          (data, response, error) in
          // check for any errors
          guard error == nil else {
            print("error calling GET")
            print(error!)
            return
          }
          // make sure we got data
          guard let responseData = data else {
            print("Error: did not receive data")
            return
          }
          // parse the result as JSON, since that's what the API provides
          do {
            let ticket = try JSONSerialization.jsonObject(with: responseData, options: [])
//              as? [String: Any] else {
//              print("error trying to convert data to JSON")
//              return
//            }
            
//            let result = ticket["result"]
//
            print(ticket)
//
            // now we have the todo
            // let's just print it to prove we can access it
//            print("The todo is: " + ticket.result.user_id)
            
            // the todo object is a dictionary
            // so we just access the title using the "title" key
            // so check for a title and print it if we have one
//            guard let description = ticket["result"]["user_id"] as? String else {
//              print("Could not get todo title from JSON")
//              return
//            }
//            print("The title is: " + description)
          } catch  {
            print("error trying to convert data to JSON")
            return
          }
        }
        task.resume()
    }


}

