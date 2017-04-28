precedencegroup LeftApplyPrecedence {
  associativity: left
  higherThan: AssignmentPrecedence
  lowerThan: TernaryPrecedence
}

precedencegroup FunctionCompositionPrecedence {
  associativity: right
  higherThan: LeftApplyPrecedence
}

precedencegroup LensCompositionPrecedence {
  associativity: right
  higherThan: LensSetPrecedence
}

precedencegroup LensSetPrecedence {
  associativity: left
  higherThan: FunctionCompositionPrecedence
}

/// Pipe forward function application.
infix operator |> : LeftApplyPrecedence

/// Infix, flipped version of fmap (for arrays), i.e. `xs ||> f := f <^> xs`
infix operator ||> : LeftApplyPrecedence

/// Infix, flipped version of fmap (for optionals), i.e. `x ?|> f := f <^> x`
infix operator ?|> : LeftApplyPrecedence

/// Composition
infix operator • : FunctionCompositionPrecedence

/// Lens composition
infix operator .. : LensCompositionPrecedence

/// Semigroup binary operation
infix operator <> : FunctionCompositionPrecedence

/// Semigroup operation partially applied on right
prefix operator <>

/// Semigroup operation partially applied on left
postfix operator <>

/// Lens view
infix operator ^* : LeftApplyPrecedence

/// Lens set
infix operator .~ : LensSetPrecedence

/// Lens over
infix operator %~ : LensSetPrecedence

/// Lens over with both part and whole.
infix operator %~~ : LensSetPrecedence

/// Lens semigroup
infix operator <>~ : LensSetPrecedence

/// Kleisli lens composition
infix operator >•>

/// Compose forward operator
infix operator >>> : FunctionCompositionPrecedence

/// Compose backward operator
infix operator <<< : FunctionCompositionPrecedence

/// Cons of an element with a non-empty collection.
infix operator +|: AdditionPrecedence
