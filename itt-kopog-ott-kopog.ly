\version "2.18.2"

\paper{
  indent=10\mm
  line-width=160\mm
  oddFooterMarkup=##f
  %oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  %scoreTitleMarkup = ##f
}

#(set-global-staff-size 26)

\score {
  <<
    \context ChordNames { \chordmode {
       c2 | a:m | d:m | g | c
    } }
    \new Staff \with {
      instrumentName = #"Violin"
      shortInstrumentName = #"V"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \clef treble
        \key c \major
        \time 2/4
        g''4 g8 a | g4 g8 a |
        g8 g g a | g f e d |
        c8 r r4 | r2 \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        \clef treble
        \key c \major
        \time 2/4
        g'4 c | a4 c |
        d,4 f | g4 g |
        c8 r r4 | r2 \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"cello"
        \clef bass
        \key c \major
        \time 2/4
        c,4 c | a4 a |
        d4 d | g,8 g a b |
        c8 r r4 | c,8 r r4 \bar "||"
      }
    >>

  >>
  \layout {}
  \midi {
    \context {
      \Staff
      \remove "Staff_performer"
    }
    \context {
      \Voice
      \consists "Staff_performer"
    }
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }

  \header { piece = "Itt kopog, ott kopog (nincs bev., sokszor), 2019v3" }

}
