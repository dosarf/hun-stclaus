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
      r1 | r1 | r1 | r1 |

      c2 c | f2 c | d4:m g c a:m | f4 g c2 |

      c2 g:7 | c2 g |

      c2 c:7 | f2 c | d4:m g c a:m | f4 g c2 |
    } }
    \new Staff \with {
      instrumentName = #"Recorder #1"
      shortInstrumentName = #"R#1"
    } <<
      \new Voice \relative c {
        \set midiInstrument = #"flute"
        \clef treble
        \key c \major
        \time 4/4

        | r1 | r1 | r1 | r1 | \break

        \repeat volta 2 { c'4 c g' g | a a g2 |
        f4 f e e | d d c2 } \break

        \repeat volta 2 {
        g'4 g f f | e e d2 }

        c4 c g' g | a a g2 |
        f4 f e e | d d c2 \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Recorder #2"
      shortInstrumentName = #"R#2"
    } <<
      \new Voice \relative c {
        \set midiInstrument = #"flute"
        \clef treble
        \key c \major
        \time 4/4

        | r1 | r1 | r1 | r1 | \break

        \repeat volta 2 { c'4 c e e | f f e2 |
        d4 d c c | d d c2 } \break

        \repeat volta 2 {
        e4 e d d | c c d2 }

        c4 c e e | f f e2 |
        d4 d c c | d d c2 \bar "||"
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
      tempoWholesPerMinute = #(ly:make-moment 90 4)
    }
  }

  \header { piece = "Hull a pelyhes - furulyák (2x), 2019v1" }
}
