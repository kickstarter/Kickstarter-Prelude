import Prelude

/*:
 # Either.swift

 ---

 ### Introduction

 The `Either` type represents values with two possibilities. In particular, if `x: Either<A, B>`, then `x`
 either holds something of type `A` or something of type `B`, but never both at the same time.

 A close cousin to `Either<A, B>` is the optional type `Optional<A>`. In the latter type, you either have a
 value of type `A`, or you have nothing. Just as `Optional` is useful for safely handling data that may be
 absent, `Either<A, B>` is useful for safely handling data that can be of one of two types. In fact,
 `Optional` can be seen as a special case of `Either` by specializing one case: `Either<A, ()>`. We will
 never use `Either` in this fashion, but it’s nice to see those connections.

 A direct sibling to `Either<A, B>` is the tuple `(A, B)`, and Swift provides first class support for that
 type. Just as we often need to combine two pieces of data to handle them together as a single unit, it can
 be useful to handle two exlcusive choices of data as a single unit.

 The rules that guide our usage of `(A, B)` apply equally well to `Either<A, B>`.

 * Values of type `Either<A, B>` do not travel far. They are typically only used in local data flow or
   private implementation details. They would rarely be used in a public function’s interface, arguments or
   return value.
 * Values are named clearly in a `leftOrRight` fashion so that it is understood what values are held in the
   left and right branches.
 * We stop the abstraction of exclusive OR at two parameters. If you ever find yourself reaching for a generic
   triple of exlusive OR types, e.g.
   ```swift
   enum ExclusiveTriple <A, B, C> {
     case Left(A)
     case Middle(B)
     case Right(C)
   }
   ```
   You should create a custom type that better describes what you are trying model.
 */

/*:
 ### Modeling `Either` data flow

 Let’s start with a basic data type to work from:
 */

struct User {
  let id: Int
  let name: String
}

/*:
 Due to the nature of using an API outside of our control, we often may come across situations where we either
 have the user’s `id` or a full `user` value. It is on us to safely handle this situation. For example,
 suppose we wanted to load a fresh version of the user from the API. The following function provides a mocked
 version of such a request:
 */

func requestUser(id id: Int) -> User {
  return User(id: id, name: "Glorp")
}

func requestUser(user user: User) -> User {
  return user
}

/*:
 Here is how we can safely handle requesting a fresh user from an `Either<User, Int>`:
 */

let userOrId = Either<User, Int>.right(1)
let freshUser = userOrId.ifLeft(requestUser(user:), ifRight: requestUser(id:))

freshUser.id
freshUser.name
