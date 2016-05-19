// swiftlint:disable nesting
import Prelude

"started"

struct Project {
  let creator: User
  let id: Int
  let name: String
  let video: Video?

  static let lens = Lens.self
  enum Lens {
    static let creator = Prelude.Lens<Project, User>(
      view: { $0.creator },
      set: { Project(creator: $0, id: $1.id, name: $1.name, video: $1.video) }
    )
    static let id = Prelude.Lens<Project, Int>(
      view: { $0.id },
      set: { Project(creator: $1.creator, id: $0, name: $1.name, video: $1.video) }
    )
    static let name = Prelude.Lens<Project, String>(
      view: { $0.name },
      set: { Project(creator: $1.creator, id: $1.id, name: $0, video: $1.video) }
    )
    static let video = Prelude.Lens<Project, Video?>(
      view: { $0.video },
      set: { Project(creator: $1.creator, id: $1.id, name: $1.name, video: $0) }
    )
  }
}

struct User {
  let id: Int
  let location: Location
  let name: String

  static let lens = Lens.self
  enum Lens {
    static let id = Prelude.Lens<User, Int>(
      view: { $0.id },
      set: { User(id: $0, location: $1.location, name: $1.name) }
    )
    static let location = Prelude.Lens<User, Location>(
      view: { $0.location },
      set: { User(id: $1.id, location: $0, name: $1.name) }
    )
    static let name = Prelude.Lens<User, String>(
      view: { $0.name },
      set: { User(id: $1.id, location: $1.location, name: $0) }
    )
  }
}

struct Location {
  let id: Int
  let name: String

  static let lens = Lens.self
  enum Lens {
    static let id = Prelude.Lens<Location, Int>(
      view: { $0.id },
      set: { Location(id: $0, name: $1.name) }
    )
    static let name = Prelude.Lens<Location, String>(
      view: { $0.name },
      set: { Location(id: $1.id, name: $0) }
    )
  }
}

struct Video {
  let id: Int
  let source: String

  static let lens = Lens.self
  enum Lens {
    static let id = Prelude.Lens<Video, Int>(
      view: { $0.id },
      set: { Video(id: $0, source: $1.source) }
    )
    static let source = Prelude.Lens<Video, String>(
      view: { $0.source },
      set: { Video(id: $1.id, source: $0) }
    )
  }
}

extension LensType where Whole == Project, Part == User {
  var id: Lens<Project, Int> {
    return Project.lens.creator • User.Lens.id
  }
  var location: Lens<Project, Location> {
    return Project.lens.creator • User.Lens.location
  }
  var name: Lens<Project, String> {
    return Project.lens.creator • User.Lens.name
  }
}

//func compose <A, B, C> (lhs: Lens<A, B>, rhs: Prism<B, C>) -> Lens<A, C?> {
//
//  return Lens(
//    view: { a in rhs.preview(lhs.view(a)) },
//    set: { (c, a) in
//      let b = lhs.view(a)
//
//    }
//  )
//}

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
  name: "Project",
  video: Video(
    id: 1,
    source: "http://www.movie.com/movie.mp4"
  )
)

//project |> Project.lens.video.id *~ 3

1 + 1
"done"
