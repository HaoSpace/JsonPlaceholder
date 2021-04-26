//
//  CollectionViewCell.swift
//  JsonPlaceholderTest
//
//  Created by kooapps on 4/25/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, CellPhoroDelegate {
    
  var cellDataViewModel: CelldataViewModel! {
        didSet {
            
            let idLable = viewWithTag(10) as! UILabel
            let titleLable = viewWithTag(20) as! UILabel
            let actIndicator = viewWithTag(40) as! UIActivityIndicatorView
            
            idLable.text = cellDataViewModel.id
            titleLable.text = cellDataViewModel.title
            actIndicator.startAnimating()
            
            cellDataViewModel.delegate = self
        }
    }
    
    func onFetchPhoto(image: UIImage?) {
        let imageView = viewWithTag(30) as! UIImageView
        let actIndicator = viewWithTag(40) as! UIActivityIndicatorView
       
        actIndicator.stopAnimating()
        
        if let image = image {
            imageView.image = image
        }
        else {
            imageView.image = UIImage(systemName: "icloud.slash")
        }
        
        cellDataViewModel.delegate = nil
    }
}
