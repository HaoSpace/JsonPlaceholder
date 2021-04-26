//
//  PhotoFetchController.swift
//  JsonPlaceholderTest
//
//  Created by kooapps on 4/25/21.
//

import Foundation

class PhotoFetchController {
    static let shared = PhotoFetchController()
    let photosRequest = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/photos")!)
    
    func StartFetchPhotos(completion: @escaping([CellData]?)->Void) {
        let session = URLSession(configuration: .default)
        var request = photosRequest
        request.httpMethod = "GET"
        session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            
            if let data = data {
                let photos = try? JSONDecoder().decode([CellData].self, from: data)
                completion(photos)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func StartFetchPhoto(path: String, completion: @escaping (Data?)->Void) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: path)!) { (data, reponse, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            
            completion(data)
        }.resume()
    }
    
}
