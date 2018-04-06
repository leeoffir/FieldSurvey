//
//  JSONLoader.swift
//  Field Survey
//
//  Created by Lee Offir on 4/6/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import Foundation

class JSONLoader {
    class func load(fileName: String) -> [FieldSurvey]{
        var observation = [FieldSurvey]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            
            observation = JSONParser.parse(data)
        }
        
        return observation
    }
}
