import SwiftUI

/// An abstract representation of the `Form` type in SwiftUI.
///
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         Form {
///             Text("Item 1")
///             Text("Item 2")
///             Text("Item 3")
///         }
///         #if os(iOS) || os(tvOS)
///         .introspect(.form, on: .iOS(.v13, .v14, .v15), .tvOS(.v13, .v14, .v15, .v16, .v17)) {
///             print(type(of: $0)) // UITableView
///         }
///         .introspect(.form, on: .iOS(.v16, .v17)) {
///             print(type(of: $0)) // UICollectionView
///         }
///         #endif
///     }
/// }
/// ```
public struct FormType: IntrospectableViewType {}

#if !os(macOS)
extension IntrospectableViewType where Self == FormType {
    public static var form: Self { .init() }
}

#if canImport(UIKit)
extension iOSViewVersion<FormType, UITableView> {
    public static let v13 = Self(for: .v13)
    public static let v14 = Self(for: .v14)
    public static let v15 = Self(for: .v15)
}

extension iOSViewVersion<FormType, UICollectionView> {
    public static let v16 = Self(for: .v16)
    public static let v17 = Self(for: .v17)
}

extension tvOSViewVersion<FormType, UITableView> {
    public static let v13 = Self(for: .v13)
    public static let v14 = Self(for: .v14)
    public static let v15 = Self(for: .v15)
    public static let v16 = Self(for: .v16)
    public static let v17 = Self(for: .v17)
}
#endif
#endif