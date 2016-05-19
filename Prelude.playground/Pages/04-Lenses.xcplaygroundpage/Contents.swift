import Prelude

/*:
 # Lenses

 ---

 ### Introduction

 A large part of our code base is built around immutable value types, which has given us a
 lot of stability and clarity in our code. Typically these models are just handed to us
 (e.g. from `KsApi`) and we very rarely need to construct them from scratch or change fields
 in a value. However, in tests we need to do this extensively, and it is very difficult
 because it requires setting a value for every field. In the case of `Project` there are
 more than a dozen fields, some of which are other models that also need to be constructed,
 and so on.

 Lenses are a simple type with a collection of functions and operators that make dealing
 with immutable value types far easier. They can be thought of as the function version of
 getters and setters.

 Getting is easy enough: just return the value in some field. Setters require constructing
 a whole new value with one part replaced.

 ### An example

 Let's first start with some immutable value types:
 */

struct Project {
  let creator: User
  let id: Int
  let name: String
}

struct User {
  let id: Int
  let location: Location
  let name: String
}

struct Location {
  let id: Int
  let name: String
}

/*:
 And let us construct a value:
 */

let project = Project(
  creator: User(
    id: 1,
    location: Location(
      id: 1,
      name: "Brooklyn"
    ),
    name: "Creator"
  ),
  id: 1,
  name: "Project"
)

/*:
 Now say we want to change the creator's name. This is quite difficult:
 */

let p1 = Project(
  creator: User(
    id: project.creator.id,
    location: project.creator.location,
    name: "Blob"
  ),
  id: project.id,
  name: project.name
)

p1.creator.name

/*:
 That's a bit of a pain and can get more complicated with more fields and more associations.
 Lenses solve this nicely. Let's create two: one for `Project.creator` and the other for
 `User.name`:
 */

let creatorLens = Lens<Project, User>(
  view: { $0.creator },
  set: { Project(creator: $0, id: $1.id, name: $1.name) }
)

let nameLens = Lens<User, String>(
  view: { $0.name },
  set: { User(id: $1.id, location: $1.location, name: $0) }
)

/*:
 That may seem even more complicated than the previous code, but once we pay the upfront
 cost of constructing lenses we get to use them in endless ways:
 */

let p2 = creatorLens.compose(nameLens).set("Blob", project)
p2.creator.name

/*:
 We can also some operators to make this more expressive:
 */

let p3 = project |> creatorLens • nameLens *~ "BLOB"
p3.creator.name

/*:
 Let's break that down into smaller pieces. First, the `•` operator composes lenses:
 */

creatorLens • nameLens

/*:
 The above is a lens from `Project` to `String` which focuses on the creator's name.
 Next, the `*~` operator is an infix operator version of `set`:
 */

creatorLens • nameLens *~ "BLOB"

/*:
 The above is now a function `Project -> Project`. Feeding a function into it will focus
 on the creator's name and switch it to `"BLOB"`. Finally, we pipe our project through
 this pipeline to get the transformed project:
 */

let p4 = project |> creatorLens • nameLens *~ "BLOB"
p4.creator.name

/*:
 We can improve this even more. First, ever immutable value type should expose a lens
 for each of its fields. We do this by exposing a static var on the type `Project.lens`
 which acts a namespace for all of its lenses. For example, this is how we would expose
 the `creator` and `name` lenses:
 */

extension Project {
  static let lens = Lens.self
  enum Lens {
    static let creator = Prelude.Lens<Project, User>(
      view: { $0.creator },
      set: { Project(creator: $0, id: $1.id, name: $1.name) }
    )
  }
}

extension User {
  static let lens = Lens.self
  enum Lens {
    static let name = Prelude.Lens<User, String>(
      view: { $0.name },
      set: { User(id: $1.id, location: $1.location, name: $0) }
    )
  }
}

/*:
 Now we can do:
 */

let p5 = project |> Project.lens.creator • User.lens.name *~ "BLORG"
p5.creator.name

/*:
 We can make this even better by adding a `name` lens to `Project.lens.creator`
 that composes the two lenses for us. This looks like:
 */

extension LensType where Whole == Project, Part == User {
  var name: Lens<Project, String> {
    return Project.lens.creator • User.Lens.name
  }
}

/*:
 And we can use it like this:
 */

let p6 = project |> Project.lens.creator.name *~ "GLORP"
p6.creator.name

/*:
 Let's implement a few more lenses on our value types:
 */

extension Project.Lens {
  static let name = Prelude.Lens<Project, String>(
    view: { $0.name },
    set: { Project(creator: $1.creator, id: $1.id, name: $0) }
  )
}

extension User.Lens {
  static let location = Prelude.Lens<User, Location>(
    view: { $0.location },
    set: { User(id: $1.id, location: $0, name: $1.name) }
  )
}

extension Location {
  static let lens = Lens.self
  enum Lens {
    static let name = Prelude.Lens<Location, String>(
      view: { $0.name },
      set: { Location(id: $1.id, name: $0) }
    )
  }
}

extension LensType where Whole == Project, Part == User {
  var location: Lens<Project, Location> {
    return Project.lens.creator • User.Lens.location
  }
}

extension LensType where Whole == Project, Part == Location {
  var name: Lens<Project, String> {
    return Project.lens.creator • User.lens.location • Location.lens.name
  }
}

/*:
 We can also change multiple fields at once. Recall that apply the `*~` operator to a lens creates a
 function `Project -> Project`. Such functions can be composed with the `<>` (this is because functions
 `A -> A` form a semigroup under composition, and `<>` is the generic operator for semigroup operations).
 Know this we can now do:
 */

let p7 = project
  |> Project.lens.name *~ "Mural in Brooklyn"
  <> Project.lens.creator.name *~ "Saunders"
  <> Project.lens.creator.location.name *~ "Greenpoint"
p7.name
p7.creator.name
p7.creator.location.name

/*:
 What if don't want to just set a field in a value but instead apply a transformation to a
 field. This can be done easily with the `%~` (read as “over”):
 */

let p8 = project |> Project.lens.name %~ { $0 + "!!!!" }
p8.name

/*:
 There are a lot of ways in which we can evolve lenses, and this is just the beginning. The
 next big piece of work will be building a tool to do the code generation of models for us.
*/

// swiftlint:disable line_length
/*
 ### See also

 * [Brandon Williams - Lenses in Swift](https://www.youtube.com/watch?v=ofjehH9f-CU)
 * [Chris Eidhof - Lenses in Swift](http://chris.eidhof.nl/post/lenses-in-swift/)
 * [A Little Lens Tutorial](https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/
 a-little-lens-starter-tutorial)
 */
