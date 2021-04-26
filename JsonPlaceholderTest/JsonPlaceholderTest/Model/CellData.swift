//
//  CellData.swift
//  JsonPlaceholderTest
//
//  Created by kooapps on 4/25/21.
//

import Foundation

struct CellData: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: URL
    var thumbnailUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
   }
    
    init(from decoder: Decoder) throws {
        
        albumId = 0
        id = 0
        title = ""
        url = FileManager.default.temporaryDirectory
        thumbnailUrl = FileManager.default.temporaryDirectory
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        if container.contains(.albumId) {
            self.albumId = try container.decodeIfPresent(Int.self, forKey: .albumId)!
        }
        
        if container.contains(.id) {
            self.id = try container.decodeIfPresent(Int.self, forKey: .id)!
        }
        
        if container.contains(.title) {
            self.title = try container.decodeIfPresent(String.self, forKey: .title)!
        }
        
        if container.contains(.url) {
            self.url = try container.decodeIfPresent(URL.self, forKey: .url)!
        }
        
        if container.contains(.thumbnailUrl) {
            self.thumbnailUrl = try container.decodeIfPresent(URL.self, forKey: .thumbnailUrl)!
        }
   }
}
