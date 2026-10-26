-- This file is a set of excercises for the Lean language

-- Basic Operations on Nat
-- E1: write a funtion to evaluate the n!

def factorial (n : Nat) : Nat :=
  match n with
  |  Nat.zero => 1
  |  Nat.succ n => n.succ*(factorial n)

#eval factorial 500

-- E2: Write a function power that computes base^power

def expo (b : Nat) (p : Nat) : Nat :=
  match p with
  | Nat.zero => 1
  | Nat.succ p => b * expo b (p)

#eval expo 2 0
#eval expo 2 1
#eval expo 2 2
#eval expo 2 3
#eval expo 2 4
#eval expo 2 5
#eval expo 2 6

-- write a funtion to evaluate the n-th fibbonacci number

def fib (n : Nat) : Nat :=
  if n < 2 then 1 else fib (n-1) + fib (n-2)


#eval fib 0
#eval fib 1
#eval fib 2
#eval fib 3
#eval fib 4
#eval fib 5
#eval fib 6
#eval fib 7
#eval fib 8

-- Inductive Datatypes
-- Write an inductive datatype Weekday with constructors for each day
inductive Weekday where
| sunday : Weekday
| monday: Weekday
| tuesday : Weekday
| wednesday : Weekday
| thursday : Weekday
| friday : Weekday
| saturday : Weekday

def nextDay (d : Weekday) : Weekday :=
  match d with
  | Weekday.sunday    => Weekday.monday
  | Weekday.monday    => Weekday.tuesday
  | Weekday.tuesday   => Weekday.wednesday
  | Weekday.wednesday => Weekday.thursday
  | Weekday.thursday  => Weekday.friday
  | Weekday.friday    => Weekday.saturday
  | Weekday.saturday  => Weekday.sunday

def isWeekend (d : Weekday) : Bool:=
  match d with
  | Weekday.sunday    => True
  | Weekday.monday    => False
  | Weekday.tuesday   => False
  | Weekday.wednesday => False
  | Weekday.thursday  => False
  | Weekday.friday    => False
  | Weekday.saturday  => True

#eval nextDay Weekday.sunday
#eval isWeekend Weekday.friday

-- Simple Arithmetic expression
inductive Expr where
| num (n: Nat)
| add (e1 e2 : Expr)
| mul (e1 e2 : Expr)

def eval (e: Expr) : Nat :=
match e with
| Expr.num e => e
| Expr.add e k => eval e + eval k
| Expr.mul e k => eval e * eval k

#eval eval (Expr.add (Expr.num 5) (Expr.num 6))
#eval eval (Expr.mul (Expr.num 5) (Expr.num 6))

-- Binary Trees
inductive Tree where
| leaf : Tree
| node (left : Tree) (val : Nat) (right : Tree) : Tree

def treeSize (t : Tree) : Nat :=
match t with
| Tree.leaf => 1
| Tree.node left val right => (treeSize left) + 1 + (treeSize right)

-- Expected Output: 0
#eval treeSize Tree.leaf
-- Expected Output: 1
#eval treeSize (Tree.node Tree.leaf 10 Tree.leaf)
-- Expected Output: 2
#eval treeSize (Tree.node (Tree.node Tree.leaf 5 Tree.leaf) 10 Tree.leaf)
-- Expected Output: 3
#eval treeSize (Tree.node (Tree.node Tree.leaf 1 Tree.leaf) 2 (Tree.node Tree.leaf 3 Tree.leaf))
-- Expected Output: 4
#eval treeSize (Tree.node (Tree.node Tree.leaf 5 (Tree.node Tree.leaf 7 Tree.leaf)) 10 (Tree.node Tree.leaf 20 Tree.leaf))
