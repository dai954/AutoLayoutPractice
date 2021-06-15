//
//  AppSearchController.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/14.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        fetchItunesApps()

    }
    
    struct SearchResult: Decodable {
        let resultCount: Int
        let results: [Result]
    }
    
    struct Result: Decodable {
        let trackName: String
        let primaryGenreName: String
    }
    

    fileprivate func fetchItunesApps() {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps", err)
            }
            
//            print(data)
//            print(String(data: data!, encoding: .utf8))
//            print(resp)
//
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                searchResult.results.forEach({ print($0.trackName, $0.primaryGenreName) })
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            
            
        }.resume()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchResultCell
    
        // Configure the cell
        cell.nameLabel.text = "HERE IS MY NAME"
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
