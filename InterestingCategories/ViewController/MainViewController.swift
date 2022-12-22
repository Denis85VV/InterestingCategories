import UIKit

class MainViewController: UIViewController, UICollisionBehaviorDelegate {
  
  private var animator: UIDynamicAnimator!
  private var gravity: UIGravityBehavior!
  private var collision: UICollisionBehavior!
  private var buttons = [CategoryButton]()
  private var counter: Int = 0
  private var mainView: MainView? {
    view as? MainView
  }
  // MARK: Our categories
  private let categories = ["Книги","Игры","Футбол","Пиво","Животные","Театр","Юмор","Еда","Кино","Рестораны","Прогулки","Политика","Новости","Автомобили","Сериалы","Рецепты","Работа","Отдых","Спорт"]
  
  override func loadView() {
    view = MainView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    makeAndSetUpButtons(names: categories, rootViewFrame: view.frame)
    
    // MARK: Gravity control
    guard let gravityView = mainView?.bodyView else { return }
    animator = UIDynamicAnimator(referenceView: gravityView)
    gravity = UIGravityBehavior(items: buttons)
    
    collision = UICollisionBehavior(items: buttons)
    collision.collisionDelegate = self
    collision.translatesReferenceBoundsIntoBoundary = true
    
    DispatchQueue.main.async {
      self.animator.addBehavior(self.collision)
      self.animator.addBehavior(self.gravity)
    }
  }
  
  private func makeAndSetUpButtons(names: [String], rootViewFrame: CGRect) {
    var oldX: CGFloat = 0
    var oldY: CGFloat = 0
    let randomX = CGFloat.random(in: 1...20)
    
    for name in names {
      let button: CategoryButton = {
        let button = CategoryButton()
        button.setTitle(name, for: .normal)
        button.frame = CGRect(
          x: oldX,
          y: oldY,
          width: button.intrinsicContentSize.width + Constants.categoryButtonTextInset,
          height: Constants.categoryButtonHeight
        )
        button.addTarget(self, action: #selector(onSelect), for: .touchUpInside)
        return button
      }()
      
      let buttonWidth = button.intrinsicContentSize.width + Constants.categoryButtonTextInset + randomX
      let buttonHeight = Constants.categoryButtonHeight + randomX
      
      if (oldX + buttonWidth) < rootViewFrame.width {
        oldX += buttonWidth
      } else {
        oldX = 0 + randomX
        oldY += buttonHeight
      }
      
      mainView?.bodyView.addSubview(button)
      self.buttons.append(button)
    }
  }
  
  // MARK: Counter for cart
  @objc func onSelect() {
    counter += 1
    
    self.animator.removeBehavior(self.collision)
    self.animator.removeBehavior(self.gravity)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.mainView?.counterLabel.text = " \(self.counter) "
    }
  }
}

private extension MainViewController {
  
  enum Constants {
    static let categoryButtonHeight: CGFloat = 59
    static let categoryButtonTextInset: CGFloat = 18
  }
}
