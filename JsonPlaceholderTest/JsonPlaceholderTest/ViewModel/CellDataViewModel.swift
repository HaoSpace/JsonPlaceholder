//
//  CellDataViewModel.swift
//  JsonPlaceholderTest
//
//  Created by kooapps on 4/26/21.
//

import Foundation
import UIKit

class CelldataViewModel {
    var id: String
    var title: String
    
    var delegate: CellPhoroDelegate?
    
    init(cellData: CellData) {
        self.id = String(cellData.id)
        self.title = cellData.title
                
        let imageName = cellData.thumbnailUrl.lastPathComponent;
        let tmpUrl = FileManager.default.temporaryDirectory
        let imageUrl = tmpUrl.appendingPathComponent(imageName)
        
        if FileManager.default.fileExists(atPath: imageUrl.path) {
            let image = UIImage(contentsOfFile: imageUrl.path)
            self.delegate?.onFetchPhoto(image: image)
        } else {
            PhotoFetchController.shared.StartFetchPhoto(path: cellData.url.absoluteString) { (data) in
                if let data = data, let image = UIImage(data: data) {
                    try? data.write(to: imageUrl)
                    DispatchQueue.main.async {
                        self.delegate?.onFetchPhoto(image: image)
                    }
                }
            }
        }
    }
}


