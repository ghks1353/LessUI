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
              on: @escaping ((Error?, UIImage?) -> Void) = { _, _ in }
              ) -> Self {
        if url == "" {
            print("[LessUI] URL is empty")
            return self
        }
        
        let req: URLRequest = URLRequest(url: URL(string: url)!)
        
        let activityIndicator: UIActivityIndicatorView? = indicator != nil ? UIActivityIndicatorView(style: indicator!) : nil
        if activityIndicator != nil {
            self.addSubview(activityIndicator!)
            
            activityIndicator!.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
            activityIndicator!.startAnimating()
        }
        
        af_imageDownloader = afDownloader
        af_setImage(withURLRequest: req) { response in
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
            
            on(response.error, response.value)
        }
        
        return self
    }
    
}
