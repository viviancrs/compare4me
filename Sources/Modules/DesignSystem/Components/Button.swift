import UIKit

class Button: UIButton {

    var isLoading: Bool = false {
        didSet {
            updateTitleColor()
            isUserInteractionEnabled = !isLoading
            isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        }
    }

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = Colors.Primary.onPrimary
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = Colors.Primary.primary
        layer.cornerRadius = 10
        updateTitleColor()
        buildActivityIndicator()
    }

    private func updateTitleColor() {
        let color = isLoading ? UIColor.clear : Colors.Primary.onPrimary
        setTitleColor(color, for: .normal)
    }

    private func buildActivityIndicator() {
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
