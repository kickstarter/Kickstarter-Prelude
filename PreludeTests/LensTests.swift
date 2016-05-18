import XCTest
@testable import Prelude

private let square: Int -> Int = { $0 * $0 }
private let add: Int -> Int -> Int = { lhs in { lhs + $0 } }
private let incr: Int -> Int = add(1)

final class LensTests: XCTestCase {
  private let user = User(id: 1, location: Location(id: 2, city: City(id: 3)))

  func testLensComposition() {
    XCTAssertEqual(2, User._location.compose(Location._id).view(user))
    XCTAssertEqual(3, User._location.compose(Location._city.compose(City._id)).view(user))
  }

  func testLensCompositionOperator() {
    XCTAssertEqual(2, (User._location • Location._id).view(user))
    XCTAssertEqual(3, (User._location • Location._city • City._id).view(user))
  }

  func testLensSetOperator() {
    XCTAssertEqual(4, (User._id *~ 4)(user).id)
  }

  func testLensSetAndCompositionOperatorPrecedence() {
    XCTAssertEqual(4, (User._location • Location._id *~ 4)(user).location.id)
  }

  func testLensViewOperator() {
    XCTAssertEqual(1, user ^* User._id)
  }

  func testLensViewAndCompositionOperatorPrecedence() {
    XCTAssertEqual(2, user ^* User._location • Location._id)
  }

  func testOver() {
    XCTAssertEqual(2, User._id.over(incr)(user).id)
  }

  func testOverOperator() {
    XCTAssertEqual(2, (User._id %~ incr)(user).id)
  }

  func testOverAndCompositionOperatorPrecedence() {
    XCTAssertEqual(3, (User._location • Location._id %~ incr)(user).location.id)
  }

  func testOperatorPrecedences() {
    XCTAssertEqual(User(id: 11, location: Location(id: 12, city: City(id: 13))),
      user
        |> User._id %~ add(10)
        <> User._location • Location._id %~ square
        <> User._location • Location._id %~ add(8)
        <> User._location • Location._city • City._id *~ 13
    )

    XCTAssertEqual(13,
      user
        |> User._id %~ add(10)
        <> User._location • Location._id %~ square
        <> User._location • Location._id %~ add(8)
        <> User._location • Location._city • City._id *~ 13
        ^* User._location • Location._city • City._id
    )
  }
}

private struct User: Equatable {
  let id: Int
  let location: Location

  static let _id = Lens<User, Int>(
    view: { $0.id },
    set: { User(id: $0, location: $1.location) }
  )

  static let _location = Lens<User, Location>(
    view: { $0.location },
    set: { User(id: $1.id, location: $0) }
  )
}

private func == (lhs: User, rhs: User) -> Bool {
  return lhs.id == rhs.id && lhs.location == rhs.location
}

private struct Location: Equatable {
  let id: Int
  let city: City

  static let _id = Lens<Location, Int>(
    view: { $0.id },
    set: { Location(id: $0, city: $1.city) }
  )

  static let _city = Lens<Location, City>(
    view: { $0.city },
    set: { Location(id: $1.id, city: $0) }
  )
}

private func == (lhs: Location, rhs: Location) -> Bool {
  return lhs.id == rhs.id && lhs.city == rhs.city
}

private struct City: Equatable {
  let id: Int

  static let _id = Lens<City, Int>(
    view: { $0.id },
    set: { (id, _) in City(id: id) }
  )
}

private func == (lhs: City, rhs: City) -> Bool {
  return lhs.id == rhs.id
}
