//
//  PlaylistDetailViewModel.swift
//  Spotify
//
//  Created by MAC31 on 9/06/22.
//


import Foundation

class PlatlistDetailViewModel {
    
    let request: Request = Request()
    
    var playlistDetail: PlaylistDetail? = nil
    
    func getPlaylistDetail(id: String) async {
        let data = await request.getDataFromAPI(url: "users/12173307072/playlists/\(id)")
        
        if data != nil {
            if let decoder = try? JSONDecoder().decode(PlaylistDetail.self, from: data!) {
                DispatchQueue.main.async(execute: {
                    self.playlistDetail = decoder
                })
            }
        }
    }
    
}

