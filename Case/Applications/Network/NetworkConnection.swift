//
//  NetworkConnection.swift
//  Case
//
//  Created by mba on 22.09.2024.
//

import Foundation
import Network

public class NetworkConnection {
    static let shared = NetworkConnection()
    
    private var monitor: NWPathMonitor
    private var isMonitoring = false
    
    init() {
        self.monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        guard !isMonitoring else { return }
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Connected")
            } else {
                print("No Connection")
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        isMonitoring = true
    }
    
    public func stopMonitoring() {
        guard isMonitoring else { return }
        monitor.cancel()
        isMonitoring = false
    }
    
    public func isConnected() -> Bool {
        return monitor.currentPath.status == .satisfied
    }
}
