//
//  HYCollectionModel.swift
//  Swift_Study
//
//  Created by Atlantis on 2023/2/27.
//

import UIKit

class HYCollectionModel: NSObject {

    
    var title :String
    var imageName:String
    var desc:String
    
    init(title: String, imageName: String, desc: String) {
        self.title = title
        self.imageName = imageName
        self.desc = desc
    }

    static func getModels() ->[HYCollectionModel]{
        return [
            HYCollectionModel.init(title: "嘿，今天如何啊", imageName: "hello", desc: "虽然我今天过的不怎么样，但是希望你好"),
            HYCollectionModel.init(title: "嘿，今天如何啊", imageName: "dudu", desc: "虽然我今天过的不怎么样，但是希望你好"),
            HYCollectionModel.init(title: "嘿，今天如何啊", imageName: "bodyline", desc: "虽然我今天过的不怎么样，但是希望你好"),
            HYCollectionModel.init(title: "嘿，今天如何啊", imageName: "wave", desc: "虽然我今天过的不怎么样，但是希望你好"),
            HYCollectionModel.init(title: "嘿，今天如何啊", imageName: "darkvarder", desc: "虽然我今天过的不怎么样，但是希望你好"),
            HYCollectionModel.init(title: "嘿，今天如何啊", imageName: "hhhhh", desc: "虽然我今天过的不怎么样，但是希望你好")
        ]
    }
}
