//
//  jsonModel.swift
//  jsonDemo
//
//  Created by HeMu on 08/12/17.
//  Copyright © 2017 HeMu. All rights reserved.
//

import UIKit

class jsonModel: NSObject {

    var str_postId:Int = Int()
    var str_id:Int = Int()
    var str_name:String = String()
    var str_email:String = String()
    var str_body:String = String()
    
    init(str_postId:Int,str_id:Int,str_name:String,str_email:String,str_body:String) {
        super.init()
        self.str_body = str_body
        self.str_id = str_id
        self.str_name = str_name
        self.str_postId = str_postId
        self.str_email = str_email
    }
    
    
}
