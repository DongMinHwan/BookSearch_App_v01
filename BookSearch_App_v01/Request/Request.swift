//
//  Request.swift
//  BookSearch_App_v01
//
//  Created by DongMin Hwang on 2023/03/04.
//

import UIKit
import Alamofire
import Toaster

class Request {
    
    static var baseUrl : String {
        get {
            return Constant.API.url
        }
    }
    
    static let jsonHeader: HTTPHeaders = ["Content-Type": "application/json"]
    
    //MARK: - error handller
    static private func handleError(_ response: DataResponse<Any, AFError>) -> ErrorModel? {
        if let result = response.data {
            if let error = try? JSONDecoder().decode(ErrorModel.self, from: result) {
                //MARK: - error 응답 받을시 toast
                if let error = try? JSONDecoder().decode(ErrorModel.self, from: result) {
                    Toast(text: error.message).show()
                    return error
                }
            }
        }
        
        return nil
    }
    
    //MARK: - get
    static func get(route: String, param: Parameters, completion: @escaping (_ data: Data?) -> Void, exception: @escaping (_ error: ErrorModel) -> Void = { error in }) {
        
        var url: String = Constant.API.url + route
        let alamo = AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: jsonHeader ).validate(statusCode: 200..<300)
        alamo.responseJSON { [self] response in
            switch response.result {
                case .success:
                completion(response.data)
                   
                    print("Api 호출")
                    return

                default:
                    if let error = handleError(response) {
                        print("Api 호출실패")
                        exception(error)
                    }
                return
            }
        }
    }
}
