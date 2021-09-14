//
//  ImageDataLoader.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import Foundation

protocol ImageDataLoaderTask {
    func cancel()
}

protocol ImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> ImageDataLoaderTask
}
