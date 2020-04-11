//
//  ViewModel.swift
//  AntiBully
//
//  Created by Fred Lefevre on 2020-04-11.
//  Copyright © 2020 Fred Lefevre. All rights reserved.
//

import Foundation

class ViewModel {
    public private (set) var textData: String
    
    lazy public private (set) var sentiment: Sentiment = {
        let prediction = try? BullyClassifier().prediction(text: textData)
        guard let label = prediction?.label else { return Sentiment(text: "Error! Could not analyze sentence.")}
        let emojiResponse = emojify(label: label)
        return Sentiment(text: emojiResponse)
    }()
    
    init(textData: String) {
        self.textData = textData
    }
    
    func emojify(label: String) -> String {
        switch label {
        case "kindness":
            return "Kind 🤗"
        case "encouragement":
            return "Encouraging 😃"
        case "mean":
            return "Mean 🤬"
        case "neutral":
            return "Neutral 😶"
        default:
            return "Unknown 😬"
        }
    }
}
