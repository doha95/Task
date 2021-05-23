//
//  NetworkingService.swift
//  Task
//
//  Created by Doha Tubaileh on 19/5/2021.
//

import Foundation
import Alamofire



class NetworkingService {
    
    static let sharedInstance = NetworkingService()
    private init() {}
    
    /**
     Fetching the person data from the server side
     */
    func urlRequestPerson(completion: @escaping([Person])->Void){
        AF.request(URL).validate().responseDecodable(of: [Person].self) { (response) in
            guard let users = response.value else { return }
            completion(users)
        }
    }
    
    /**
     Fetching the person detail data from the server side
     
     - Parameter userName: The user name is needed to fetch the detail.
     */
    func requestPersonDetail(with userName:String , completion: @escaping(PersonDetail)->Void){
        AF.request(URL_DETAIL + userName).validate().responseDecodable(of: PersonDetail.self) { (response) in
            guard let detail = response.value else { return }
            completion(detail)
        }
    }
}
