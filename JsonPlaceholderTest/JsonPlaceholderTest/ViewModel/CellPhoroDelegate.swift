//
//  CellPhoroDelegate.swift
//  JsonPlaceholderTest
//
//  Created by kooapps on 4/26/21.
//

import UIKit

@objc
protocol CellPhoroDelegate: NSObjectProtocol {

    func onFetchPhoto(image: UIImage?)
}
