//
//  NetUIImageViewExt.swift
//  LessUI
//
//  Created by Seru on 11/04/2019.
//

import Foundation
import UIKit

import Alamofire
import AlamofireImage

public extension UIImageView {
    
    /// Load image from external URL with Alamofire downloader
    @discardableResult
    func load(_ url: String,
              indicator: UIActivityIndicatorView.Style? = .gray,
              
              afDownloader: ImageDownloader? = nil,
              on: @escaping ((Error?) -> Void) = { _ in }
              ) -> Self {
        let req: URLRequest = URLRequest(url: URL(string: url)!)
        let downloader: ImageDownloader = afDownloader ?? ImageDownloader(configuration: ImageDownloader.defaultURLSessionConfiguration(),
                                                                          downloadPrioritization: .fifo,
                                                                          maximumActiveDownloads: 1,
                                                                          imageCache: AutoPurgingImageCache())
        
        let activityIndicator: UIActivityIndicatorView? = indicator != nil ? UIActivityIndicatorView(style: indicator!) : nil
        if activityIndicator != nil {
            self.addSubview(activityIndicator!)
            
            activityIndicator!.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
            activityIndicator!.startAnimating()
        }
        
        downloader.download(req) { response in
            if response.error != nil && response.result.value != nil {
                self.image = response.result.value
            }
            
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
            
            on(response.error)
        }
        
        return self
    }
    
}
