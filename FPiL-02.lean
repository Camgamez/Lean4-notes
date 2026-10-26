-- Let's use the .drop and .dropEnd properties of the String.Slice type.
#eval (("small tortoiseshell".drop 6).dropEnd 5)


#eval ("red admiral".dropEndWhile Char.isAlpha).copy
-- I didn't do much here, but this was my second read.
