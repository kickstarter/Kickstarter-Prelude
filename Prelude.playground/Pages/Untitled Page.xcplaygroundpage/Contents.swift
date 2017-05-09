import Prelude

func id<A>(_ x: A) -> A {
  return x
}

struct Setting<A> {
  let unsetting: A
  init(_ unsetting: A) {
    self.unsetting = unsetting
  }
}

struct Getting<B, A> {
  let got: B
  init(_ got: B) {
    self.got = got
  }
}

struct SetterLens<S, T, A, B> {
  let f: (@escaping (A) -> B) -> (S) -> T
  init(_ f: @escaping (@escaping (A) -> B) -> (S) -> T) {
    self.f = f
  }
}

struct GetterLens<S, T, A, B, G> {
  let f: (@escaping (A) -> Getting<G, B>) -> (S) -> Getting<G, T>
  init(_ f: @escaping (@escaping (A) -> Getting<G, B>) -> (S) -> Getting<G, T>) {
    self.f = f
  }
}

struct Complex<A> {
  let real: A
  let imag: A
}

func .. <U, V, S, T, A, B>(lhs: SetterLens<U, V, S, T>, rhs: SetterLens<S, T, A, B>) -> SetterLens<U, V, A, B> {
  return .init(rhs.f >>> lhs.f)
}

func .. <U, V, S, T, A, B, G>(lhs: GetterLens<U, V, S, T, G>, rhs: GetterLens<S, T, A, B, G>) -> GetterLens<U, V, A, B, G> {

  return .init(rhs.f >>> lhs.f)
}

let setRealLens = SetterLens<Complex<Double>, Complex<Double>, Double, Double> { f in
  return { z in
    Complex(real: f(z.real), imag: z.imag)
  }
}

let setImagLens = SetterLens<Complex<Double>, Complex<Double>, Double, Double> { f in
  return { z in
    Complex(real: z.real, imag: f(z.imag))
  }
}

let getRealLens = GetterLens<Complex<Double>, Complex<Double>, Double, Double, Double> { f in
  return { z in
    Getting<Double, Complex<Double>>(f(z.real).got)
  }
}

let getImagLens = GetterLens<Complex<Double>, Complex<Double>, Double, Double, Double> { f in
  return { z in
    Getting<Double, Complex<Double>>(f(z.imag).got)
  }
}

struct Project {
  let id: Int
  let creator: User
}
let setCreatorLens = SetterLens<Project, Project, User, User> { f in
  return { project in
    Project(id: project.id, creator: f(project.creator))
  }
}
struct User {
  let id: Int
  let name: String
}
let setNameLens = SetterLens<User, User, String, String> { f in
  return { user in
    User(id: user.id, name: f(user.name))
  }
}
let z = Complex(real: 3.0, imag: -3.0)
dump(setRealLens.f({ x in x + 2.0 })(z))

dump(getRealLens.f(Getting.init)(z))
dump(getImagLens.f(Getting.init)(z))

// <Project, Project, User, User> .. <User, User, String, String>
let project = Project(id: 2, creator: User(id: 5, name: "Blob"))


dump(
  project
    |> (setCreatorLens..setNameLens).f(<>"!!!")
)



