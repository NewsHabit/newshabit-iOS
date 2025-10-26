//
//  BaseViewController.swift
//  DesignKit
//
//  Created by 지연 on 10/26/25.
//

import UIKit

import SnapKit

public enum NavigationBarStyle {
    case back(String)
    case backBookmark
}

open class BaseViewController<View: UIView>: UIViewController {
    // MARK: - Properties
    
    private var navigationBarStyle: NavigationBarStyle?
    
    // MARK: - Components
    
    private let navigationBar = UIView()
    
    public let contentView = View()
    
    private lazy var titleLabel = makeTitleLabel()
    
    public lazy var backButton = makeButton(with: .chevronLeft)
    
    public lazy var bookmarkButton = makeButton(with: .bookmark)
    
    // MARK: - Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupLayout()
        setupGestureRecognizer()
    }
    
    // MARK: - Setup Methods
    
    private func setupViewController() {
        view.backgroundColor = .bgNormal
        navigationController?.isNavigationBarHidden = true
    }
    
    // 커스텀 네비게이션 바를 사용하지 않는 초기 레이아웃
    private func setupLayout() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func setupBackButtonLayout() {
        navigationBar.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupBookmarkButtonLayout() {
        navigationBar.addSubview(bookmarkButton)
        bookmarkButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setupGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleViewTap)
        )
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Action Methods
    
    @objc private func handleViewTap() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.view.endEditing(true)
        }
    }
    
    // MARK: - Configure Methods
    
    public func updateBookmarkStatus(_ isActive: Bool) {
        guard case .backBookmark = navigationBarStyle else { return }
        bookmarkButton.setImage(isActive ? .bookmarkActive : .bookmark, for: .normal)
    }
    
    public func configureNavigationBar(with style: NavigationBarStyle) {
        self.navigationBarStyle = style
        
        switch style {
        case .back(let title):
            configureNavigationBar(title: title, isBackButtonEnabled: true)
        case .backBookmark:
            configureNavigationBar(isBackButtonEnabled: true, isBookmarkButtonEnabled: true)
        }
    }
    
    private func configureNavigationBar(
        title: String? = nil,
        isBackButtonEnabled: Bool = false,
        isBookmarkButtonEnabled: Bool = false
    ) {
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(58)
        }
        titleLabel.text = title
        navigationBar.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        if isBackButtonEnabled { setupBackButtonLayout() }
        if isBookmarkButtonEnabled { setupBookmarkButtonLayout() }
        contentView.snp.remakeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

private extension BaseViewController {
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .labelNormal
        label.font = .bold(size: 18)
        return label
    }
    
    func makeButton(with image: UIImage) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        return button
    }
}
