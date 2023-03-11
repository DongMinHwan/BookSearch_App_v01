//
//  Constant.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/04.
//

import Foundation


class Constant {
    
    struct API {
        static var url: String {
        
            var url : String? = nil
//            url =  "https://www.googleapis.com/books/v1/volumes"
            url =  "https://www.googleapis.com/books/v1/"
            
            return url ?? ""
        }
    }
    
}
