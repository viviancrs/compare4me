import UIKit

protocol CompareUSDResultSectionViewType: UIView {
    func show(viewModel: CompareUSDResultSectionViewModel)
}

class CompareUSDResultSectionView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Surface.onBackground
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Content.lowEmphasis
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var highlightSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Content.highEmphasis
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var itemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Spacing.small
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CompareUSDResultSectionView: CompareUSDResultSectionViewType {
    func show(viewModel: CompareUSDResultSectionViewModel) {
        titleLabel.text = viewModel.title
        for (index, item) in viewModel.items.enumerated() {
            let isTheLast = index == viewModel.items.count - 1
            addItem(title: item.title, value: item.value, isTheLast: isTheLast)
        }
    }
}

extension CompareUSDResultSectionView {
    private func setupUI() {
        backgroundColor = Colors.Surface.background
        buildViewHierarchy()
        addConstraintsToTitle()
        addConstraintsToSeparators()
        addConstraintsItemsStackView()
    }

    private func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(separatorView)
        addSubview(highlightSeparatorView)
        addSubview(itemsStackView)
    }

    private func addConstraintsToTitle() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func addConstraintsToSeparators() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.standard),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: Sizes.micro),

            highlightSeparatorView.topAnchor.constraint(equalTo: separatorView.topAnchor),
            highlightSeparatorView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            highlightSeparatorView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            highlightSeparatorView.heightAnchor.constraint(equalTo: separatorView.heightAnchor)
        ])
    }

    private func addConstraintsItemsStackView() {
        NSLayoutConstraint.activate([
            itemsStackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: Spacing.tiny),
            itemsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            itemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func addItem(title: String, value: String?, isTheLast: Bool) {
        let titleLabel = createTitleLabel(title)
        let valueLabel = createValueLabel(value)
        let separatorView = createSeparatorView()

        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)

        itemsStackView.addArrangedSubview(stackView)
        itemsStackView.addArrangedSubview(isTheLast ? UIView() : separatorView)
    }

    private func createSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = Colors.Content.lowEmphasis
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 1)
        ])

        return view
    }

    private func createTitleLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.text = title
        label.textColor = Colors.Surface.onSurface
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func createValueLabel(_ value: String?) -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.text = value
        label.textColor = Colors.Content.mediumEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
