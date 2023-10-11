module MyLib  where

import Euterpea

p1 :: Pitch
p1 = (C, 4)

p2 :: Pitch
p2 = (E, 4)

p3 :: Pitch
p3 = (G, 4)

-- simple melody
mel :: Music Pitch
mel = note qn p1 :+: note qn p2 :+: note qn p3

-- simple melody harmonized with minor third
mel1 :: Music Pitch
mel1 = (note qn p1 :=: note qn (trans (-3) p1)) :+:
                (note qn p2 :=: note qn (trans (-3) p2)) :+:
                (note qn p3 :=: note qn (trans (-3) p3))

hNote :: Dur -> Pitch -> Music Pitch
hNote x p = note x p :=: note x (trans (-3) p)

hNoteI :: Dur -> Int -> Pitch -> Music Pitch
hNoteI x i p = note x p :=: note x (trans i p)

mel2 :: Music Pitch
mel2 = hNote qn p1 :+: hNote qn p2 :+: hNote qn p3

mel3 :: Music Pitch
mel3 = hList qn [p1, p2, p3] (-3)

hList :: Dur -> [Pitch] -> Int -> Music Pitch
hList dd ps i = foldr ((:+:) . hNoteI dd i) (rest 0) ps
