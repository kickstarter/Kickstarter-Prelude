precedencegroup LeftApplyPrecendence {
  associativity: left
  higherThan: AssignmentPrecedence
  lowerThan: TernaryPrecedence
}

precedencegroup FunctionCompositionPrecedence {
  associativity: right
  higherThan: LeftApplyPrecendence
}

precedencegroup LensSetPrecedence {
  associativity: left
  higherThan: FunctionCompositionPrecedence
}

/// Pipe forward function application.
infix operator |> : LeftApplyPrecendence

/// Pipe forward function application with discardable result.
infix operator *|> : LeftApplyPrecendence

/// Infix, flipped version of fmap (for arrays), i.e. `xs ||> f := f <^> xs`
infix operator ||> : LeftApplyPrecendence

/// Infix, flipped version of fmap (for optionals), i.e. `x ?|> f := f <^> x`
infix operator ?|> : LeftApplyPrecendence

/// Composition
infix operator • : FunctionCompositionPrecedence

/// Semigroup binary operation
infix operator <> : FunctionCompositionPrecedence

/// Semigroup operation partially applied on right
prefix operator <>

/// Semigroup operation partially applied on left
postfix operator <>

/// Lens view
infix operator ^* : LeftApplyPrecendence

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
