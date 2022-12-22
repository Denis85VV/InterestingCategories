import UIKit

class ProceedView: UIView {
  
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("Продолжить", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    button.backgroundColor = .white
    button.contentEdgeInsets = UIEdgeInsets(top: 29, left: 51, bottom: 29, right: 51)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupInitialLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let height = button.bounds.height
    button.layer.cornerRadius = height / 2
  }
  
  private func setupInitialLayout() {
    addSubview(button)
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
