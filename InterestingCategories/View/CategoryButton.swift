import UIKit

class CategoryButton: UIButton {
  
  private var categoryState: CategoryState = .nonSelected {
    didSet {
      backgroundColor = categoryState.backgroundColor
      setImage(
        UIImage(
          systemName: self.categoryState.imageString,
          withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 13,
            weight: .bold,
            scale: .large
          )
        ), for: .normal
      )
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    backgroundColor = .black
    setImage(
      UIImage(
        systemName: "plus",
        withConfiguration: UIImage.SymbolConfiguration(
          pointSize: 13, weight: .bold, scale: .large
        )
      ), for: .normal
    )
    imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    semanticContentAttribute = .forceRightToLeft
    tintColor = .white
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    
    addTarget(self, action: #selector(onSelect), for: .touchUpInside)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let height = bounds.height
    layer.cornerRadius = height / 2
  }
  
  private func animate(sender: UIButton) {
    UIView.animate(withDuration: 0.7, delay: 0, options: [], animations: {
      self.frame = CGRect(x: 20, y: 45, width: self.bounds.width, height: self.bounds.height)
      self.alpha = 0.2
    }, completion: { _ in
      UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
        self.frame = CGRect(x: 20, y: 45, width: 1, height: 1)
      }, completion: { _ in
        self.removeFromSuperview()
      })
    })
  }
  
  @objc func onSelect() {
    categoryState = categoryState == .selected ? .nonSelected : .selected
    self.animate(sender: self)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CategoryButton {
  
  enum CategoryState {
    case selected
    case nonSelected
    
    var backgroundColor: UIColor {
      switch self {
      case .selected:
        return .xFF5317
      case .nonSelected:
        return .black
      }
    }
    
    var imageString: String {
      switch self {
      case .selected:
        return "checkmark"
      case .nonSelected:
        return "plus"
      }
    }
  }
}
