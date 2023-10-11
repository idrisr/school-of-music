module TwoFiveOne where

import Euterpea

t251 :: Music Pitch
t251 =
    let dMinor = d 4 qn :=: f 4 qn :=: a 4 qn
        gMajor = g 4 qn :=: b 4 qn :=: d 5 qn
        cMajor = c 4 bn :=: e 4 bn :=: g 4 bn
     in dMinor :+: gMajor :+: cMajor

twoFiveOne :: Pitch -> Dur -> Music Pitch
twoFiveOne p y =
    let
        z :: Int -> Music Pitch
        z j = note y $ trans j p
        myChord :: Traversable t => t Int -> Music Pitch
        myChord xs = foldr (:=:) (rest 0) $ fmap z xs
        oneMajor = myChord [0, 4, 7]
        twoMinor = myChord [2, 5, 9]
        fiveMajor = myChord [7, 11, 2]
     in
        twoMinor :+: fiveMajor :+: oneMajor
