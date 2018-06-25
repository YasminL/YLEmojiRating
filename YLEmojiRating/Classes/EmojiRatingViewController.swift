//
//  EmojiRatingViewController.swift
//  Cloudy
//
//  Created by Yasmin Lindholm on 6/22/18.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

public class EmojiRatingViewController: UIViewController {
    
    // MARK: Properties
    
    private var emojiRatingView: EmojiRatingView?
    
    public var viewModel: EmojiRatingViewViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: View Setup
    
    private func setupView() {
        emojiRatingView = EmojiRatingView(frame: view.bounds)
        
        if let emojiRatingView = emojiRatingView {
            emojiRatingView.delegate = self
            view.addSubview(emojiRatingView)
        }
    }
    
    // MARK: View Updates
    
    private func updateView() {
        if let emojiRatingView = emojiRatingView, let viewModel = viewModel {
            emojiRatingView.set(title: viewModel.title)
            emojiRatingView.set(description: viewModel.description)
            emojiRatingView.set(cancelButtonText: viewModel.cancelButtonText)
            emojiRatingView.set(submitButtonText: viewModel.submitButtonText)
        }
    }
    
    // MARK: Appstore
    
    public func openAppstore() {
        if let appstoreLink = viewModel?.appStoreLink, let url = URL(string: appstoreLink), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    // MARK: Email
    
    public func openEmail() {
        if let emailLink = viewModel?.emailLink, let url = URL(string: emailLink), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            }
        }
    }
}

extension EmojiRatingViewController: EmojiRatingViewDelegate {
    
    func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func submitButtonTapped() {
        if let chosenStar = viewModel?.chosenStar {
            switch chosenStar {
            case .fourStars, .fiveStars:
                openAppstore()
                break
            case .none, .oneStar, .twoStars, .threeStars:
                openEmail()
                break
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func oneStarButtonTapped() {
        viewModel?.chosenStar = .oneStar
    }
    
    func twoStarButtonTapped() {
        viewModel?.chosenStar = .twoStars
    }
    
    func threeStarButtonTapped() {
        viewModel?.chosenStar = .threeStars
    }
    
    func fourStarButtonTapped() {
        viewModel?.chosenStar = .fourStars
    }
    
    func fiveStarButtonTapped() {
        viewModel?.chosenStar = .fiveStars
    }
}
