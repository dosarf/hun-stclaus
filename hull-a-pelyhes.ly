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
      instrumentName = #"Violin"
      shortInstrumentName = #"V"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
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
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        \clef treble
        \key c \major
        \time 4/4

        | r1 | r1 | r1 | r1 | \break

        \repeat volta 2 {
          <<
            { c'2 g' | f2 e |
              f2 e |
            }
            \\
            { r4 g, r g | r4 a r g |
              r4 g r c |
            }
          >>
          \oneVoice
          a4 b c2
        }

        \repeat volta 2 {
          <<
            { g'2 f | e2 d | }
            \\
            { r4 g, r g | r4 g r g | }
          >>
          \oneVoice
        }

        <<
          { c2 g' | f2 e |
            f2 e |
          }
          \\
          { r4 g, r g | r4 a r g |
            r4 g r c |
          }
        >>
        \oneVoice
        a4 b c2  \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice \relative c, {
        \set midiInstrument = #"cello"
        \clef bass
        \key c \major
        \time 4/4


       c'4 c g' g | a a g2 |
        f4 f e e | d d c2 |

	     \repeat volta 2 { c4 c e c | f c e c |
       d b c a | f g c2 }
       \repeat volta 2 {
       e4 c d b | c a g2 }

       c4 c e c | f c e c |
       d b c a | f g c2 \bar "||"
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

  \header { piece = "Hull a pelyhes (2x), 2019v4" }
}
