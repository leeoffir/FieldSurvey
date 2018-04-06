//
//  JSONParser.swift
//  Field Survey
//
//  Created by Lee Offir on 4/6/18.
//  Copyright © 2018 Lee Offir. All rights reserved.
//

import Foundation

class JSONParser {
    
    static let dateFormat = DateFormatter()
    
    class func parse(_ data: Data) -> [FieldSurvey] {
        var fieldSurveys = [FieldSurvey]()
        dateFormat.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String]{
                        if let classificationType = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormat.date(from: dateString){
                            
                            if let fieldSurvey = FieldSurvey(classificationType: classificationType, title: title, description: description, date: date){
                                
                                fieldSurveys.append(fieldSurvey)
                                
                            }
                            
                        }
                        
                    }
                }
            }
            
        }
        
        
        return fieldSurveys
    }
}
