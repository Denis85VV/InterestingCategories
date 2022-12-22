import UIKit

class MainView: UIView {
  
  let bodyView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()
  
  private let headerImage: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(
      systemName: "cart.fill",
      withConfiguration: UIImage.SymbolConfiguration(
        pointSize: 24,
        weight: .bold,
        scale: .large
      )
    )
    view.tintColor = .white
    view.setContentHuggingPriority(.required, for: .horizontal)
    view.setContentCompressionResistancePriority(.required, for: .horizontal)
    return view
  }()
  
  private let bottomView: ProceedView = {
    let view = ProceedView()
    view.backgroundColor = .black
    return view
  }()
  
  let counterLabel: UILabel = {
    let label = UILabel()
    label.text = " 0 "
    label.textColor = .white
    label.backgroundColor = .xFF5317
    label.clipsToBounds = true
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.layer.borderWidth = 3
    label.layer.borderColor = UIColor.xFF5317.cgColor
    return label
  }()
  
  private let headerLabel: UILabel = {
    let label = UILabel()
    label.text = "Выберите жанры, которые вам больше всего интересны"
    label.numberOfLines = 0
    label.textColor = .white
    label.font = .systemFont(ofSize: 16, weight: .bold)
    return label
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    counterLabel.layer.cornerRadius = 12
  }
  
  private func setupInitialLayout() {
    addSubview(bodyView)
    addSubview(headerImage)
    headerImage.addSubview(counterLabel)
    bodyView.addSubview(headerLabel)
    addSubview(bottomView)
    
    headerImage.translatesAutoresizingMaskIntoConstraints = false
    headerImage.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    headerImage.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 16).isActive = true
    
    counterLabel.translatesAutoresizingMaskIntoConstraints = false
    counterLabel.topAnchor.constraint(equalTo:headerImage.topAnchor, constant: -10).isActive = true
    counterLabel.trailingAnchor.constraint(equalTo:headerImage.trailingAnchor, constant: 10).isActive = true
    
    headerLabel.translatesAutoresizingMaskIntoConstraints = false
    headerLabel.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
    headerLabel.leadingAnchor.constraint(equalTo:headerImage.trailingAnchor, constant: 24).isActive = true
    headerLabel.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -16).isActive = true
    
    bodyView.translatesAutoresizingMaskIntoConstraints = false
    bodyView.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
    bodyView.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
    bodyView.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
    bodyView.bottomAnchor.constraint(equalTo:bottomView.topAnchor, constant: -12).isActive = true
    
    bottomView.translatesAutoresizingMaskIntoConstraints = false
    bottomView.leadingAnchor.constraint(equalTo:self.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    bottomView.heightAnchor.constraint(equalToConstant: 90).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
