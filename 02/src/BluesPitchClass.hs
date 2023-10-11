module BluesPitchClass where

import Euterpea

data BluesPitchClass
    = Ro -- root
    | Mt -- minor third
    | Fo -- fourth
    | Fi -- fifth
    | Ms -- minor seventh
    deriving (Show, Eq)

type BluesPitch = (BluesPitchClass, Octave)

ro :: Octave -> Dur -> Music BluesPitch
ro o dx = note dx (Ro, o)

mt :: Octave -> Dur -> Music BluesPitch
mt o dx = note dx (Mt, o)

fo :: Octave -> Dur -> Music BluesPitch
fo o dx = note dx (Fo, o)

fi :: Octave -> Dur -> Music BluesPitch
fi o dx = note dx (Fi, o)

ms :: Octave -> Dur -> Music BluesPitch
ms o dx = note dx (Ms, o)

{-
In order to play a value of
    type Music BluesPitch using MIDI

it will have to be converted into a Music Pitch value

define a function

fromBlues :: Music BluesPitch -> Music Pitch

to do this, using the “approximate” translation
described at the beginning of this exercise. Hint: To do this properly, you will
have to pattern match against the Music value, something like this:
-}

fromBlues :: Music BluesPitch -> Music Pitch
fromBlues (Prim (Note d p)) = undefined
fromBlues (Prim (Rest d)) = undefined
fromBlues (m1 :+: m2) = undefined
fromBlues (m1 :=: m2) = undefined
fromBlues (Modify x y) = undefined
