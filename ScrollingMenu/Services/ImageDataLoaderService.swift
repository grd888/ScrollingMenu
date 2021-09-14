//
//  ImageDataLoaderService.swift
//  ScrollingMenu
//
//  Created by GD on 9/14/21.
//

import Foundation

final class ImageDataLoaderService: ImageDataLoader {
    typealias Result = ImageDataLoader.Result
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> ImageDataLoaderTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return URLDataLoaderTask(task)
    }
}

final class URLDataLoaderTask: ImageDataLoaderTask {
    var task: URLSessionDataTask
    
    init(_ task: URLSessionDataTask) {
        self.task = task
    }
    func cancel() {
        task.cancel()
    }
}
