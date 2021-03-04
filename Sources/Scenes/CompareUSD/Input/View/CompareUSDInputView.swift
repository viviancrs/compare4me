import UIKit

protocol CompareUSDInputViewType: UIView {
    typealias BlockValues = (_ usdValue: Double, _ brlValue: Double) -> Void

    var didTapCompareBlock: BlockValues? { get set }
    func show(viewModel: CompareUSDInputViewModel)
}

class CompareUSDInputView: UIView {
    var didTapCompareBlock: BlockValues?

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
        textField.isTitleHiddenWhenTextIsEmpty = true
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // TODO - criar componente de moeda
    private lazy var brlTextField: FloatingLabelTextField = {
        let textField = FloatingLabelTextField()
        textField.title = AppStrings.priceInBrazil.localized
        textField.placeholder = AppStrings.priceInBrazil.localized
        textField.isTitleHiddenWhenTextIsEmpty = true
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
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

extension CompareUSDInputView {
    private func setupUI() {
        backgroundColor = Colors.Surface.background
        buildViewHierarchy()
        addConstraintsToLogoImageView()
        addConstraintsToStackView()
        addConstraintsToTextFields()
    }

    private func buildViewHierarchy() {
        addSubview(logoImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(usdTextField)
        stackView.setCustomSpacing(Spacing.standard, after: usdTextField)
        stackView.addArrangedSubview(brlTextField)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(compareButton)
    }

    private func addConstraintsToLogoImageView() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),

            logoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),

            logoImageView.heightAnchor.constraint(equalToConstant: Sizes.hugeXX)
        ])
    }

    private func addConstraintsToStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }

    private func addConstraintsToTextFields() {
        NSLayoutConstraint.activate([
            compareButton.heightAnchor.constraint(equalToConstant: Sizes.mediumX)
        ])
    }
}
