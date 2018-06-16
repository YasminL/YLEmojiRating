//
//  YLEmojiRatingView.swift
//  YLEmojiRating
//
//  Created by Yasmin Lindholm on 6/13/18.
//  Copyright © 2018 Yasmin Lindholm. All rights reserved.
//

import UIKit

protocol YLEmojiRatingViewDelegate: class {
    func cancelButtonTapped()
    func submitButtonTapped()
    func oneStarButtonTapped()
    func twoStarButtonTapped()
    func threeStarButtonTapped()
    func fourStarButtonTapped()
    func fiveStarButtonTapped()
}

class YLEmojiRatingView: UIView {
    
    // MARK: Variables
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var submitButton: UIButton!
    
    private let nibName = "YLEmojiRatingView"
    private var contentView: UIView!
    
    public weak var delegate: YLEmojiRatingViewDelegate?
    
    // MARK: Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.center = self.center
    }
    
    // MARK: Setup
    
    private func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        if let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            contentView = nibView
            addSubview(nibView)
            setupRoundedCornersFor(view: nibView)
        }
    }
    
    private func setupRoundedCornersFor(view: UIView) {
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
    }
    
    // MARK: Customize
    
    func set(backgroundColor: UIColor) {
        contentView.backgroundColor = backgroundColor
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
    
    func set(titleFont: UIFont) {
        titleLabel.font = titleFont
    }
    
    func set(titleColor: UIColor) {
        titleLabel.textColor = titleColor
    }
    
    func set(description: String) {
        descriptionLabel.text = description
        descriptionLabel.sizeToFit()
    }
    
    func set(descriptionFont: UIFont) {
        descriptionLabel.font = descriptionFont
    }
    
    func set(descriptionColor: UIColor) {
        descriptionLabel.textColor = descriptionColor
    }
    
    func set(cancelButtonText: String) {
        cancelButton.setTitle(cancelButtonText, for: .normal)
    }
    
    func set(submitButtonText: String) {
        submitButton.setTitle(submitButtonText, for: .normal)
    }
    
    // MARK: Actions
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        delegate?.cancelButtonTapped()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        delegate?.submitButtonTapped()
    }
    
    @IBAction func oneStarButtonTapped(_ sender: Any) {
        delegate?.oneStarButtonTapped()
    }
    
    @IBAction func twoStarButtonTapped(_ sender: Any) {
        delegate?.twoStarButtonTapped()
    }
    
    @IBAction func threeStarButtonTapped(_ sender: Any) {
        delegate?.threeStarButtonTapped()
    }
    
    @IBAction func fourStarButtonTapped(_ sender: Any) {
        delegate?.fourStarButtonTapped()
    }
    
    @IBAction func fiveStarButtonTapped(_ sender: Any) {
        delegate?.fiveStarButtonTapped()
    }
}
