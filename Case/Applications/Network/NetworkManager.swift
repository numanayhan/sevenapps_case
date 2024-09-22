//
//  NetworkManager.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // Internet bağlantısını kontrol eden fonksiyon
    private func isConnectedToInternet() -> Bool {
        return NetworkConnection.shared.isConnected()
    }
    
    // İnternet yoksa banner gösteren fonksiyon
    private func showNoInternetBanner() {
        StatusBarBanner.showBanner(message: "İnternet Bağlantısı Yok!", backgroundColor: .red, textColor: .white, duration: 3.0)
    }
    
    
    // Generic Request Function
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod = .get,
        completion: @escaping (Result<T, AFError>) -> Void
    ) {
        
        // Önce internet bağlantısını kontrol ediyoruz
        if !isConnectedToInternet() {
            // Eğer internet yoksa banner'ı gösteriyoruz ve işlemi durduruyoruz
            showNoInternetBanner()
            completion(.failure(AFError.sessionTaskFailed(error: NSError(domain: "No internet connection", code: -1009, userInfo: nil))))
            return
        }
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = method.rawValue
        
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Content-Type", value: "application/json"))
        
        request.allHTTPHeaderFields = headers.dictionary
        
        AF.request(request).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
