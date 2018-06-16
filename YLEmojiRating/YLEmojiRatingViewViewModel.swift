//
//  YLEmojiRatingViewModel.swift
//  YLEmojiRating
//
//  Created by Yasmin Lindholm on 6/16/18.
//  Copyright © 2018 Yasmin Lindholm. All rights reserved.
//

public enum Stars: Int {
    case none
    case oneStar
    case twoStars
    case threeStars
    case fourStars
    case fiveStars
}

public class YLEmojiRatingViewViewModel {
    var appStoreLink: String
    var emailLink: String
    var chosenStar: Stars
    
    var title: String
    var description: String
    var cancelButtonText: String
    var submitButtonText: String
    
    public init(appStoreID: String,
                email: String,
                chosenStar: Stars = .none,
                title: String = "",
                description: String = "",
                cancelButtonText: String = "Cancel",
                submitButtonText: String = "Submit") {
        self.appStoreLink = "https://itunes.apple.com/app/id\(appStoreID)?action=write-review"
        self.emailLink = "mailto:\(email)"
        self.chosenStar = chosenStar
        self.title = title
        self.description = description
        self.cancelButtonText = cancelButtonText
        self.submitButtonText = submitButtonText
    }
}
