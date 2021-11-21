import UIKit

class FloatingLabelTextField: UITextField {
    private let titleHeight = Sizes.standard
    private let errorHeight = Sizes.standard
    private let lineHeight: CGFloat = 1

    var isTitleHiddenWhenTextIsEmpty: Bool = false {
        didSet {
            updateStyle()
        }
    }

    var title: String = "" {
        didSet {
            titleLabel.text = title.uppercased()
            updateStyle()
        }
    }

    var error: String = "" {
        didSet {
            errorLabel.text = error
            updateStyle()
        }
    }

    var hasError: Bool = false {
        didSet {
            updateStyle()
        }
    }

    override var placeholder: String? {
        didSet {
            updateStyle()
        }
    }

    private var style: Style {
        switch (hasError, hasFocus) {
        case (true, _):
            return .error
        case (_, true):
            return .focus
        default:
            return .standard
        }
    }

    private var hasFocus: Bool = false {
        didSet {
            updateStyle()
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Primary.primaryDark
        label.font = .preferredFont(forTextStyle: .caption2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Feedback.alert
        label.font = .preferredFont(forTextStyle: .caption2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        hasFocus = true
        return result
    }

    override func resignFirstResponder() -> Bool {
        let result = super.resignFirstResponder()
        hasFocus = false
        return result
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let superRect = super.textRect(forBounds: bounds)
        return calculateRect(forBounds: superRect)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let superRect = super.editingRect(forBounds: bounds)
        return calculateRect(forBounds: superRect)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        calculateRect(forBounds: bounds)
    }
}

// MARK: Utils
extension FloatingLabelTextField {
    private enum Style {
        case error
        case focus
        case standard

        var color: UIColor? {
            switch self {
            case .standard: return Colors.Content.lowEmphasis
            case .focus: return Colors.Primary.primaryDark
            case .error: return Colors.Feedback.alert
            }
        }
    }

    private func calculateRect(forBounds bounds: CGRect) -> CGRect {
        let height = bounds.size.height - titleHeight - lineHeight - errorHeight
        let rect = CGRect(x: 0, y: titleHeight, width: bounds.size.width, height: height)
        return rect
    }
}

// MARK: Styles
extension FloatingLabelTextField {
    private func updateStyle() {
        updateColors()
        updateVisibility()
    }

    private func updatePlaceholder() {
        attributedPlaceholder = NSMutableAttributedString(string: placeholder ?? "")
            .apply(font: .preferredFont(forTextStyle: .callout))
    }

    private func updateVisibility() {
        let isTextEmpty = text?.isEmpty ?? true
        titleLabel.isHidden = isTitleHiddenWhenTextIsEmpty && isTextEmpty

        errorLabel.isHidden = !hasError
    }

    private func updateColors() {
        lineView.backgroundColor = style.color
    }
}

// MARK: Setup UI
extension FloatingLabelTextField {
    private func setupUI() {
        borderStyle = .none
        font = .preferredFont(forTextStyle: .callout)
        textColor = Colors.Surface.onBackground
        tintColor = Colors.Primary.primaryDark
        buildViewHierarchy()
        addConstraints()
        bindActions()
        updateStyle()
    }

    private func bindActions() {
        self.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    @objc private func editingChanged() {
        updateStyle()
    }

    private func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(lineView)
        addSubview(errorLabel)
    }

    private func addConstraints() {
        addConstraintsToTitleLabel()
        addConstraintsToLineView()
        addConstraintsToErrorLabel()
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Sizes.large)
        ])
    }

    private func addConstraintsToTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleHeight)
        ])
    }

    private func addConstraintsToLineView() {
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -errorHeight),
            lineView.heightAnchor.constraint(equalToConstant: lineHeight)
        ])
    }

    private func addConstraintsToErrorLabel() {
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            errorLabel.heightAnchor.constraint(equalToConstant: errorHeight)
        ])
    }
}
