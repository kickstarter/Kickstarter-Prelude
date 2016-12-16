import Prelude

/*:
# Array.swift

## Additions to `Array`

---

The Swift standard library doesn’t provide quite everything we need when it comes to array processing.
We extend the `Array` type with a few essential functions, and we try to be thoughtful with each addition.

One of the most useful additions to `Array` is `compact`. We will often find ourselves with an array of
optional values and we simply want to discard any `nil` values while also unwrapping any non`-nil` values.
This is precisely what `compact` does:
*/

let xs: [Int?] = [1, 2, nil, 3, 4, nil, nil, 5, nil]
xs.compact()
xs.compact().reduce(0, +)

/*:
The following will not compile because `+` does not know how to operate on optional integers:
*/

// xs.reduce(0, combine: +)
