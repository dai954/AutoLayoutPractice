//
//  Service.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/16.
//

import Foundation

class  Service {
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps", err)
                completion([], nil)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
//                searchResult.results.forEach({ print($0.trackName, $0.primaryGenreName) })
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            
            
        }.resume()
    }
    
}
