//
//  YLEmojiRatingViewViewModelTests.swift
//  YLEmojiRatingTests
//
//  Created by Yasmin Lindholm on 6/16/18.
//  Copyright © 2018 Yasmin Lindholm. All rights reserved.
//

import XCTest
@testable import YLEmojiRating

class YLEmojiRatingViewViewModelTests: XCTestCase {
    
    func test_Can_Instantiate_ViewModel_With_Data() {
        let appStoreID = "868077558"
        let appStoreLink = "https://itunes.apple.com/app/id\(appStoreID)?action=write-review"
        let email = "yasmin.lindholm@hotmail.com"
        let emailLink = "mailto:\(email)"
        let chosenStar = Stars.fiveStars
        let title = "Enjoying the app?"
        let description = "Tap one of the emojis and give us some feedback!"
        let cancelButtonText = "Cancel"
        let submitButtonText = "Submit"
    
        let viewModel = YLEmojiRatingViewViewModel(appStoreID: appStoreID,
                                                   email: email,
                                                   chosenStar: chosenStar,
                                                   title: title,
                                                   description: description,
                                                   cancelButtonText: cancelButtonText,
                                                   submitButtonText: submitButtonText)
        
        XCTAssertEqual(appStoreLink, viewModel.appStoreLink)
        XCTAssertEqual(emailLink, viewModel.email)
        XCTAssertEqual(title, viewModel.title)
        XCTAssertEqual(chosenStar, viewModel.chosenStar)
        XCTAssertEqual(description, viewModel.description)
        XCTAssertEqual(cancelButtonText, viewModel.cancelButtonText)
        XCTAssertEqual(submitButtonText, viewModel.submitButtonText)
    }
}
