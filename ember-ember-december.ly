\version "2.18.2"

\paper{
  indent=0\mm
  line-width=120\mm
  oddFooterMarkup=##f
  % oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  % scoreTitleMarkup = ##f
}

\score {
  <<
    \context ChordNames { \chordmode {
      g2 c2 | g2 c2 | g2 c2 | d1 |
      g2 c2 | g2 c2 | g2 d2 | g1 |
      d2 g2 | d2 g2 | d2 g2 | d2:7 g2 |
    } }

    \new Staff \with {
      instrumentName = #"Violin/Recorder"
      shortInstrumentName = #"V/R"
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
          g''4 d e c | b8 d4. c2 |
          b8 d4. c4 b | a2 a |
          g'4 d e c | b8 d4. c2 |
          b4 d c a |
        }
        \new Voice = "second" { \voiceTwo
          b4 r g2 | g2 e |
          g2 e | d2 d |
          b'4 r g2 | g2 e |
          d2 d |
        }
        >>
        \oneVoice
        g2 g
        \repeat volta 2 {
          a8 a fis4 g8 g d4 |
          a'8 a fis4 g8 g d4 |
          a'8 a fis4 g8 g d4 |
          d4 d g8 g g4
        }
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

  \header { piece = "Ember, ember, december (nincs bev., 2x), 2019v1" }
}
