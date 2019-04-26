// See https://github.com/devxoul/Pure

/// A module that can be constructed with a factory.
public protocol FactoryModule: Module {

  /// A factory for `Self`.
  associatedtype Factory = RxTextureIGListKit.Factory<Self>

  /// Creates an instance of a module with a dependency.
  init(dependency: Dependency)
}

public extension FactoryModule where Dependency == Void {
  /// Creates an instance of a module.
  init() {
    self.init(dependency: Void())
  }
}

#if os(iOS) || os(tvOS)
import UIKit

public extension FactoryModule where Self: UIViewController {
  init(dependency: Dependency) {
    self.init(nibName: nil, bundle: nil)
  }
}
#endif

#if os(macOS)
import AppKit

public extension FactoryModule where Self: NSViewController {
  init(dependency: Dependency) {
    self.init(nibName: nil, bundle: nil)
  }
}
#endif
