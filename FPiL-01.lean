-- initial read through the first few sections of https://lean-lang.org/functional_programming_in_lean/
#eval 1+2 * 5

#eval String.append "Hello, " "Lean"

#eval (1+2)*5

#eval String.append "great " (String.append "oak " "tree")

#eval String.append "it is " (if 3 > 2 then "yes" else "no")

#eval 42+19

#eval String.append "A" (String.append "B" "C")

#eval String.append ("A" String.append "B") "C"

#eval if 3 == 3 then 5 else 7

#eval if 3 == 4 then "equal" else "not equal"

#eval (1 - 2 : Nat)
#eval (1 - 2 : Int)

#check String.append "Hello " "meine liebe"
#check String.append ["hello", " "] "world"

def hello := "Hello"
def lean : String := "Lean"

#eval String.append hello (String.append " " lean)

def succ (n : Nat) : Nat := n+1

#eval succ 7

def sum (n m : Nat) : Nat := n+m
#eval sum 5 3


def maxim (n : Nat) (k : Nat) : Nat :=
  if n < k then k else n

#eval maxim 5 6
#eval maxim (5+8) (maxim 7 8)

def spaceBet (before : String) (after : String) : String :=
  String.append before (String.append " " after)

#eval spaceBet "Hello" "Lean"

#check sum
#check (sum)
#check maxim
#check (maxim)

def joinStringWith (a : String) (b: String) (c: String) : String :=
  String.append b (String.append a c)

#eval joinStringWith ", " "one" "and another"

#check (joinStringWith ": ")

def volume (h d w : Nat) : Nat :=
  h*d*w

#eval volume 2 3 4

def Str : Type := String

def a : Str := "This is a string"
#eval a

#check 1.2

structure Point where
  x : Float
  y : Float

def origin : Point := {x := 0.0, y := 0.0}
#eval origin

#eval origin.x

def addPoints (p1:Point) (p2:Point) : Point :=
  {x:= p1.x + p2.x, y:=p1.y + p2.y}

#eval addPoints {y:= 32, x:= 1.5} {x:= -8, y:= 0.2}

#eval "one string".append " and another"

structure RectangularPrism where
  height : Float
  width : Float
  depth : Float

def PrimVolume (p : RectangularPrism) : Float :=
  p.depth * p.height * p.width

def prisma1 : RectangularPrism :=
  {width := 2.0, depth := 3.0, height := 4.1}

#eval PrimVolume prisma1

structure Segment where
  start : Float
  endpoint : Float

def length (s : Segment) :Float :=
  if s.start < s.endpoint then s.endpoint - s.start else s.start - s.endpoint

def segment1 : Segment := {start:= 5, endpoint := 1.2}
#eval length segment1

structure Hamster where
  name : String
  fluffy : Bool

def hamsName (hamster: Hamster): String :=
  hamster.name

def hamtaro : Hamster := {fluffy := True, name := "Hamtaro"}

#eval hamsName hamtaro

structure Book where
  makeBook ::
  title : String
  author : String
  price : Float

def CienAnos : Book := {title:= "Cien Años de Soledad", author := "Gabo", price := 100}

#eval CienAnos.price
