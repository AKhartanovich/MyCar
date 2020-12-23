//
//  NetworkLayer.swift
//  MyCar
//
//  Created by MacBook on 21.12.20.
//  Copyright © 2020 khartanovichao. All rights reserved.
//

import Foundation


class NetworkLayer {
    
    static let shared = NetworkLayer()
    private init(){}
    
    enum HttpMethods: String {
        case get = "GET"
        case post = "POST"
    }
    
    enum APIUrl: String {
        case typicode = "https://jsonplaceholder.typicode.com/users"
    }
    
    func getUsers1() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            print(String(data: data, encoding: .utf8))
        }
        
        task.resume()
    }
    
    func getUsers2(pathComponent: String, httpMethod: String) {
        var baseUrl = URL(string: "https://jsonplaceholder.typicode.com")!
        var url = baseUrl
        url.appendPathComponent(pathComponent)
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        request.httpMethod = httpMethod
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response else {return}
            print(response)
        }
        task.resume()
    }
    
    func getUsers(pathComponent: String, httpMethod: String, complition: @escaping (Data?, Error?) -> Void) {
        var baseUrl = URL(string: "https://api.edmunds.com/api/inventory/v1/lookup?vin=1FT7X2B68CEA05672&zipcode=16229&range=50&fmt=json")!
        var url = baseUrl
//        url.appendPathComponent(pathComponent)
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        request.httpMethod = httpMethod
        request.httpBody = Data()
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            complition(data,error)
            
        }
        
//        URLSession.shared.uploadTask(with: <#T##URLRequest#>, from: <#T##Data#>)
//        URLSession.shared.downloadTask(with: <#T##URL#>, completionHandler: <#T##(URL?, URLResponse?, Error?) -> Void#>)
        
        task.resume()
    }
}


