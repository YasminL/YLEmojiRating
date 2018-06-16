//
//  YLEmojiRatingViewController.swift
//  YLEmojiRating
//
//  Created by Yasmin Lindholm on 6/15/18.
//  Copyright © 2018 Yasmin Lindholm. All rights reserved.
//

public class YLEmojiRatingViewController: UIViewController {
    
    // MARK: Properties
    
    private var emojiRatingView: YLEmojiRatingView?
    private var viewModel: YLEmojiRatingViewViewModel?
    
    // MARK: Life cycle
    
    public init(viewModel: YLEmojiRatingViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setupPresentationStyle()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: Setup
    
    private func setupPresentationStyle() {
        modalPresentationStyle = .overCurrentContext
    }
    
    private func setupView() {
        emojiRatingView = YLEmojiRatingView(frame: view.bounds)
        
        if let emojiRatingView = emojiRatingView {
            emojiRatingView.delegate = self
            view.addSubview(emojiRatingView)
            
            if let viewModel = viewModel {
                emojiRatingView.set(title: viewModel.title)
                emojiRatingView.set(description: viewModel.description)
                emojiRatingView.set(cancelButtonText: viewModel.cancelButtonText)
                emojiRatingView.set(submitButtonText: viewModel.submitButtonText)
            }
        }
    }
    
    // MARK: Appstore
    
    private func openAppstore() {
        if let appstoreLink = viewModel?.appStoreLink, let url = URL(string: appstoreLink), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: Email
    
    private func openEmail() {
        if let emailLink = viewModel?.emailLink, let url = URL(string: emailLink), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

extension YLEmojiRatingViewController: YLEmojiRatingViewDelegate {
    
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
