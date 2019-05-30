//
//  VideosModel.swift
//  TiktokClone
//
//  Created by Engineer 144 on 28/05/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import UIKit
class VideosModel : NSObject {
    
    
    
    var videos : [Videos] = [Videos(videourl: "https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4",
                                    username: "YawMain",
                                    videodesc: "@danceHallKing playing with me and about",
                                    songTitle: "I love coding",
                                    likescount: 20,
                                    commentcount: 200,
                                    profileUrl: ""),
                             Videos(videourl: "https://storage.googleapis.com/coverr-main/mp4/Mt_Baker.mp4",
                                    username: "@yawMain",
                                    videodesc: "@danceHallKing playing with me and about",
                                    songTitle: "I love coding",
                                    likescount: 20,
                                    commentcount: 200,
                                    profileUrl: ""
        
        
        )]

}


class Videos : NSObject {
    
    var videoURL : String
    var userName : String
    var videoDiscription: String
    var songTitle: String
    var likesCount: Int
    var commentCount: Int
    var profileImageUrl: String
    
    
    init(videourl: String,username:String,videodesc:String,songTitle:String,likescount:Int,commentcount:Int,profileUrl:String){
    
        self.videoURL = videourl
        self.userName = username
        self.videoDiscription = videodesc
        self.songTitle = songTitle
        self.likesCount = likescount
        self.commentCount = commentcount
        self.profileImageUrl = profileUrl
        
    }
    
    
}



