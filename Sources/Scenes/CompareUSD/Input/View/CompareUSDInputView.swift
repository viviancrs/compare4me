import UIKit

protocol CompareUSDInputViewType: UIView {
    func show(viewModel: CompareUSDInputViewModel)
}

class CompareUSDInputView: UIView {

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
        label.text = Localizable.priceInTheUSA.localized
        return label
    }()

    // TODO - criar componente de moeda
    private lazy var usdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Localizable.typeTheValue.localized
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
        label.text = Localizable.priceInBrazil.localized
        return label
    }()

    // TODO - criar componente de moeda
    private lazy var brlTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Localizable.typeTheValue.localized
        textField.borderStyle = .line
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // TODO - criar componente de botão
    private lazy var compareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle(Localizable.compare.localized, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CompareUSDInputView: CompareUSDInputViewType {
    func show(viewModel: CompareUSDInputViewModel) {
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

            logoImageView.heightAnchor.constraint(equalToConstant: 128)
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
            usdTextField.heightAnchor.constraint(equalToConstant: 30),

            brlTextField.heightAnchor.constraint(equalToConstant: 30),

            compareButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
