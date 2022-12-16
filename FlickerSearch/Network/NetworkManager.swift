//
//  NetworkManager.swift
//  FlickerSearch
//
//  Created by kamilcal on 16.12.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
     func fetchImage(with url: String?, completion: @escaping (Data) -> Void) {
        if let urlString = url, let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
                if let err = error{
                    print(err)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                        //                        ! Görsel indirildiğinde ımageView' a atama yapmak istiyorum. Return etmeme sebebimiz, indirme işlemine başladıktan sonra sonuçların çok geç dönebileceği, yeni bir cell oluşmasına rağmen sunucudan data gelmediğinden sporunlar yaşanabiliyor. o yüzden complietion tanımlamak daha doğru
                        //                        cell.photoImageView.image = UIImage(data: data)
                        }
                }
            } .resume()
        }
    }
}
