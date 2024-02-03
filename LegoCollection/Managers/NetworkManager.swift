//
//  NetworkManager.swift
//  LegoCollection
//
//  Created by Hüseyin Kaya on 2.02.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
     let APIKey = "3-rZJI-eW56-ErHwT"
     let baseURL = "https://brickset.com/api/v3.asmx/getSets?apiKey="
    
    private init() {}
    
    func getSets(completed: @escaping (LEGOSetResponse?, String?) -> Void) {
        let endpoint = "\(baseURL)\(APIKey)&userHash=&params={'theme':'BrickHeadz'}" // the theme will be selected
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Invalid request")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please try again.")
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server, Please try again.")
                return
            }
                        
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let legoSets = try decoder.decode(LEGOSetResponse.self, from: data)
                completed(legoSets, nil)
            } catch {
                completed(nil, "The data received from the server was invalid")
            }
        }
        task.resume()
    }
        
}

