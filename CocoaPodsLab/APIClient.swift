//
//  APIClient.swift
//  CocoaPodsLab
//
//  Created by Gregory Keeley on 3/3/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    static func getRandomUsers(completion: @escaping (AFResult<ResultsWrapper>) -> ()) {
        let endpoint = "https://randomuser.me/api/?results=50"
        guard let url = URL(string: endpoint) else {
            return
        }
        AF.request(url).response { (response) in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(results))
                } catch {
                    print("Error decoding random users: \(error)")
                }
            }
            
        }
    }
}
