// See https://github.com/devxoul/Pure

/// A module that can be configurated with an existing instance.
public protocol ConfiguratorModule: class, Module {

  /// A configurator for `Self`.
  associatedtype Configurator = RxTextureIGListKit.Configurator<Self>

  /// Configures an existing module with a dependency.
  func configure(dependency: Dependency)
}

public extension ConfiguratorModule where Dependency == Void {
  /// Configures an existing module.
  func configure() {
    self.configure(dependency: Void())
  }
}
