import UIKit

protocol CompareUSDResultViewType: UIView {
    func show(viewModel: CompareUSDResultViewModel)
}

class CompareUSDResultView: UIView {
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
        stackView.layoutMargins = UIEdgeInsets(top: Spacing.standard,
                                               left: Spacing.standard,
                                               bottom: Spacing.standard,
                                               right: Spacing.standard)
        stackView.spacing = Spacing.semi
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var valuesInBrazilSection: CompareUSDResultSectionView = {
        let section = CompareUSDResultSectionView()
        section.translatesAutoresizingMaskIntoConstraints = false
        return section
    }()

    private var importValuesSection: CompareUSDResultSectionView = {
        let section = CompareUSDResultSectionView()
        section.translatesAutoresizingMaskIntoConstraints = false
        return section
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CompareUSDResultView: CompareUSDResultViewType {
    func show(viewModel: CompareUSDResultViewModel) {
        valuesInBrazilSection.show(viewModel: viewModel.valuesInBrasil)
        importValuesSection.show(viewModel: viewModel.importValues)
    }
}

extension CompareUSDResultView {
    private func setupUI() {
        backgroundColor = Colors.Neutrals.neutral0
        buildViewHierarchy()
        addConstraintsToScrollView()
        addConstraintsToStackView()
    }

    private func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(valuesInBrazilSection)
        stackView.addArrangedSubview(importValuesSection)
    }

    private func addConstraintsToScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func addConstraintsToStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
