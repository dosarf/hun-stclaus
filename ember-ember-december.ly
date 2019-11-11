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
      g2 c2 | g2 c2 | g2 c2 | d1 |
      g2 c2 | g2 c2 | g2 d2 | g1 |
      d2 g2 | d2 g2 | d2 g2 | d2:7 g2 |
    } }

    \new Staff \with {
      instrumentName = #"Violin"
      shortInstrumentName = #"V"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \voiceOne
        \clef treble
        \key g \major
        \time 4/4
        g''4 d e c | b8 d4. c2 |
        b8 d4. c4 b | a2 a |
        g'4 d e c | b8 d4. c2 |
        b4 d c a | g2 g
        \repeat volta 2 {
            c8 c a4 b8 b g4 | c8 c a4 b8 b g4 |
            c8 c a4 b8 b g4 | fis8 fis a4 g8 g g4
          }
        }
    >>

    \new Staff \with {
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        \clef treble
        \key g \major
        \time 4/4
        <<
        \new Voice = "first" { \voiceOne
          g''4 d e c | b4 d c2 |
          b4 d c b | a2 a |
          g'4 d e c | b4 d c2 |
          b4 d c a | g2 g |

          \repeat volta 2 {
            c4 a b g | c4 a b g |
            c4 a b g | a4 a g g
          }
        }
        \new Voice = "second" { \voiceTwo
          r8 g r g r g r g | r8 g r g r4 g |
          r8 g r g r g r g | r4 d r2 |
          r8 g r g r g r g | r8 g r g r4 g |
          r8 g r g r d r d | r4 d r2 |

          \repeat volta 2 {
            r8 d r d r d r d | r8 d r d r d r d |
            r8 d r d r d r d | r8 d r d r d r4 |
          }
        }
        >>
      }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"cello"
        \voiceOne
        \clef bass
        \key g \major
        \time 4/4
        g,4 b c e | g4 g c,2 |
        g4 b c e | d2 d |
        g,4 b c e | g4 g g g |
        g4 g d fis | g2 g, |
        \repeat volta 2 {
            d'4 d g g |
            d4 d g g |
            d4 d g g |
            d4 c g g
          }
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }

  \header { piece = "Ember, ember, december (nincs bev., 2x), 2019v3" }
}
