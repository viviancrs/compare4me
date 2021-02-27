import UIKit

protocol CompareDollarInputViewType: UIView {
    func show(viewModel: CompareDollarInputViewModel)
}

class CompareDollarInputView: UIView {

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

    private lazy var dollarLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Neutrals.neutral100
        label.font = .preferredFont(forTextStyle: .callout)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preço em dólar" // TODO - substituir por módulo de localização
        return label
    }()

    // TODO - criar componente de moeda
    private lazy var dollarTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o valor"
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var realLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Neutrals.neutral100
        label.font = .preferredFont(forTextStyle: .callout)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preço em real" // TODO - substituir por módulo de localização
        return label
    }()

    // TODO - criar componente de moeda
    private lazy var realTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o valor"
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // TODO - criar componente de botão
    private lazy var compareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Comparar", for: .normal) // TODO - substituir por módulo de localização
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

extension CompareDollarInputView: CompareDollarInputViewType {
    func show(viewModel: CompareDollarInputViewModel) {
    }
}

extension CompareDollarInputView {
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
        stackView.addArrangedSubview(dollarLabel)
        stackView.addArrangedSubview(dollarTextField)
        stackView.setCustomSpacing(Spacing.standard, after: dollarTextField)
        stackView.addArrangedSubview(realLabel)
        stackView.addArrangedSubview(realTextField)
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
            dollarTextField.heightAnchor.constraint(equalToConstant: 30),

            realTextField.heightAnchor.constraint(equalToConstant: 30),

            compareButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
