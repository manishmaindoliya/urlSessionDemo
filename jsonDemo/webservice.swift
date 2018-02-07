//  webservice.swift
//  jsonDemo
//  Created by HeMu on 08/12/17.
//  Copyright © 2017 HeMu. All rights reserved.

import UIKit

class webservice: NSObject {

    //https://jsonplaceholder.typicode.com/comments?postId=1

    class func Apicall(consumer:@escaping(_ completion:NSDictionary)->Void ){

     let is_URL = "https://jsonplaceholder.typicode.com/posts/1"
        
        let lobj_Request = NSMutableURLRequest(url: NSURL(string: is_URL)! as URL)
        let session = URLSession.shared
        var err: NSError?
        
        lobj_Request.httpMethod = "GET"
        
        let task = session.dataTask(with: lobj_Request as URLRequest, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            
            
                 do {
            let  jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                
                print("response======",jsonDictionary)
                
                    let getPostID = jsonDictionary.object(forKey:"userId")
                    let getStrID = jsonDictionary.object(forKey:"id")
                    let getName = jsonDictionary.object(forKey:"title")
                    let getMail = jsonDictionary.object(forKey:"body")
                    
                let InsertModel:jsonModel = jsonModel.init(str_postId:getPostID as! Int , str_id: getStrID as! Int, str_name: getName as! String, str_email: getMail as! String, str_body: "xyc")
                  
                print(InsertModel)

                consumer(jsonDictionary)
                    
            } catch
            {
                print(error)
            }
            
            if error != nil
            {
             //   print("Error: " + error.description)
            }
            
        })
        task.resume()
    }

}
