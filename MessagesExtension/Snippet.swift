//
//  Snippet.swift
//  One Liners
//
//  Created by Ajit Sarkaar on 29/10/17.
//  Copyright © 2017 Ajit Sarkaar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Snippet: NSObject{
    
    var name: String?;
    var image: UIImage?;
    var audioClipURL: URL?;
    
    init(name: String, icon: UIImage, soundURL: URL) {
        self.name = name;
        image = icon;
        audioClipURL = soundURL;
    }
    
    
}
