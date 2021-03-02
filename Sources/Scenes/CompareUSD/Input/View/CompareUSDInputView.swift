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
        stackView.spacing = Spacing.tiny
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

    private lazy var usdLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Neutrals.neutral100
        label.font = .preferredFont(forTextStyle: .callout)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppStrings.priceInTheUSA.localized
        return label
    }()

    // TODO - criar componente de moeda
    private lazy var usdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = AppStrings.typeTheValue.localized
        textField.borderStyle = .line
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var brlLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Neutrals.neutral100
        label.font = .preferredFont(forTextStyle: .callout)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppStrings.priceInBrazil.localized
        return label
    }()

    // TODO - criar componente de moeda
    private lazy var brlTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = AppStrings.typeTheValue.localized
        textField.borderStyle = .line
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
        backgroundColor = Colors.Neutrals.neutral0
        buildViewHierarchy()
        addConstraintsToLogoImageView()
        addConstraintsToStackView()
        addConstraintsToTextFields()
    }

    private func buildViewHierarchy() {
        addSubview(logoImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(usdLabel)
        stackView.addArrangedSubview(usdTextField)
        stackView.setCustomSpacing(Spacing.standard, after: usdTextField)
        stackView.addArrangedSubview(brlLabel)
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
            usdTextField.heightAnchor.constraint(equalToConstant: 24),

            brlTextField.heightAnchor.constraint(equalToConstant: 24),

            compareButton.heightAnchor.constraint(equalToConstant: Sizes.mediumX)
        ])
    }
}
