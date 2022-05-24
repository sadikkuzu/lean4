namespace Example

class Mul (α : Type u) where
  mul : α → α → α

infixl:70 " * " => Mul.mul

def double [Mul α] (a : α) := a * a

class Semigroup (α : Type u) extends Mul α where
  mul_assoc : ∀ a b c : α, (a * b) * c = a * (b * c)

instance : Semigroup Nat where
  mul := Nat.mul
  mul_assoc := Nat.mul_assoc

#eval double 5

class Functor (f : Type u → Type v) : Type (max (u+1) v) where
  map : (α → β) → f α → f β

infixr:100 " <$> " => Functor.map

class LawfulFunctor (f : Type u → Type v) [Functor f] : Prop where
  id_map   (x : f α) : id <$> x = x
  comp_map (g : α → β) (h : β → γ) (x : f α) :(h ∘ g) <$> x = h <$> g <$> x

end Example
