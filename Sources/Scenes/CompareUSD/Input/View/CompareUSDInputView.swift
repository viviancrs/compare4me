import UIKit

protocol CompareUSDInputViewType: UIView {
    typealias BlockValues = (_ usdValue: Double, _ brlValue: Double) -> Void

    var didTapCompareBlock: BlockValues? { get set }
    func show(viewModel: CompareUSDInputViewModel)
}

class CompareUSDInputView: UIView {
    var notificationCenter: NotificationCenterType
    var didTapCompareBlock: BlockValues?

    private var bottomConstraint: NSLayoutConstraint?

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.layoutMargins = UIEdgeInsets(top: Spacing.small,
                                               left: Spacing.small,
                                               bottom: Spacing.small,
                                               right: Spacing.small)
        stackView.spacing = Spacing.standard
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: Images.logo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // TODO - criar componente de moeda
    private lazy var usdTextField: FloatingLabelTextField = {
        let textField = FloatingLabelTextField()
        textField.title = AppStrings.priceInTheUSA.localized
        textField.placeholder = AppStrings.priceInTheUSA.localized
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // TODO - criar componente de moeda
    private lazy var brlTextField: FloatingLabelTextField = {
        let textField = FloatingLabelTextField()
        textField.title = AppStrings.priceInBrazil.localized
        textField.placeholder = AppStrings.priceInBrazil.localized
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var compareButton: Button = {
        let button = Button(title: AppStrings.compare.localized)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCompare), for: .touchUpInside)
        return button
    }()

    init(notificationCenter: NotificationCenterType = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        super.init(frame: .zero)
        addKeyboardObservers()
        setupUI()
    }

    deinit {
        removeKeyboardObservers()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTapCompare() {
        let usdValue = Double(usdTextField.text ?? "") ?? 0
        let brlValue = Double(brlTextField.text ?? "") ?? 0
        didTapCompareBlock?(usdValue, brlValue)
    }
}

extension CompareUSDInputView: CompareUSDInputViewType {
    func show(viewModel: CompareUSDInputViewModel) {
        compareButton.isLoading = viewModel.isButtonLoading
    }
}

extension CompareUSDInputView: Keyboardable {
    func didUpdateKeyboard(height: CGFloat) {
        bottomConstraint?.constant = -height
        layoutIfNeeded()
    }
}

extension CompareUSDInputView {
    private func setupUI() {
        backgroundColor = Colors.Surface.background
        buildViewHierarchy()
        addConstraintsToScrollView()
        addConstraintsToLogoImageView()
        addConstraintsToStackView()
        addConstraintsToCompareButton()
    }

    private func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(usdTextField)
        stackView.setCustomSpacing(Spacing.standard, after: usdTextField)
        stackView.addArrangedSubview(brlTextField)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(compareButton)
    }

    private func addConstraintsToScrollView() {
        let bottomConstraint = scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bottomConstraint,
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        self.bottomConstraint = bottomConstraint
    }

    private func addConstraintsToStackView() {
        let heightConstraint = stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultHigh

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint
        ])
    }

    private func addConstraintsToLogoImageView() {
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: Sizes.hugeXX)
        ])
    }

    private func addConstraintsToCompareButton() {
        NSLayoutConstraint.activate([
            compareButton.heightAnchor.constraint(equalToConstant: Sizes.mediumX)
        ])
    }
}
