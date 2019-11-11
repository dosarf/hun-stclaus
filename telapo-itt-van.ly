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
      f4 c | f a:m |
      bes c | f2 |

      f4 c | f c |
      f4 c | f c |
      f4 c | f c |
      f4 c | f c |
      f4 c | f a:m |
      bes c | f2
    } }
    \new Staff \with {
      instrumentName = #"Violin"
      shortInstrumentName = #"V"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \clef treble
        \key f \major
        \time 2/4
        a'4 c | a8 a c4 | a8 g a g | f8 f f4 \bar "||" \break

        a4 g8 g | f4 g |
        a4 g8 g | f4 g |
        a4 g8 g | f4 g |
        a4 g8 g | f4 g |
        \repeat volta 2 {
          a4 c | a8 a c4 |
          a8 g a g | f f f4
        }
      }
    >>

    \new Staff \with {
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        \clef treble
        \key f \major
        \time 2/4
        r2 | r2 | r2 | r2 |

        f4 e8 e | c4 e |
        f4 e8 e | c4 e |
        f4 e8 e | c4 e |
        f4 e8 e | c4 e |
        \repeat volta 2 {
          f4 g | f8 f a4 |
          d,4 e | c8 c c4
        }
      }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"cello"
        \clef bass
        \key f \major
        \time 2/4
        r2 | r2 | r2 | r2 |

        f,4 c4 | a4 c |
        f4 c4 | a4 c |
        f4 c4 | a4 c |
        f4 c4 | a4 c |
        \repeat volta 2 {
          f4 e | f4 a,4 |
          bes c | f8 f f4
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
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }

  \header { piece = "Télapó itt van (bev. furulya, 2 versszak), 2019v2" }

}
