//
//  Request.swift
//  Spotify
//
//  Created by MAC31 on 15/05/22.
//

import Foundation

class Request {
    
    let token = "BQCmy5Ciz2GaO9yA6qBGa2ycmxah0geTrS1ZG2-G76iEnT3EjiLZOD-n9hjHn5MTKgM1DWksPWp0XhqPbMzvOBPS9ZHg33irACZmbZ_U_e--xlXqS8RpE9SjHRFq0CaB-ZG6_yQxmDdIPJDfWNGCbvmba3Yzs01a9DVSoHDUlPF9N-fUyw&refresh_token=AQCff4jjDyOudwYDRDDIzWe5hKky0PwHP-XAWN1b3IY7Xngl-a6VTYmtB1yLaqcHSI0rvhoC6cxc4Y8cNg9jrREUPG96ulQYeA8ExKyRF0hpQRiL1m6MG0KxB9S6c_0mOvg"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data? {
        do {
            var request = URLRequest(url: HelperString.getURLFromString(url: "\(BASE_URL)\(url)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            return data
        } catch {
            return nil
        }
    }
}
