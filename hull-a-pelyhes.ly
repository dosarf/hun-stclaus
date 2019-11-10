\version "2.18.2"

\paper{
  indent=0\mm
  line-width=120\mm
  oddFooterMarkup=##f
  %oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  %scoreTitleMarkup = ##f
}

\score {
  <<
    \context ChordNames { \chordmode {
      r1 | r1 | r1 | r1 |

      c2 c | f c | d4:m g c a:m | f g c2 |
      c2 f | c g |

      c2 c:7 | f c | d4:m g c a:m | f g c2 |
    } }
    \new Staff \with {
      instrumentName = #"Violin/Recorder"
      shortInstrumentName = #"V/R"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \voiceOne
        \clef treble
        \key c \major
        \time 4/4

        | r1 | r1 | r1 | r1 | \break

        \repeat volta 2 { c'4 c g' g | a a g2 |
        f4 f e e | d d c2 }

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
          c4 c
          <<
          { g' g | a4 a g2 }
          \\
          { e2 | f2 e }
          >>
          \oneVoice
          f4 f e e | d d c2
        }

        \repeat volta 2 {
          <<
            { g'4 g f f }
            \\
            { e2 a, }
          >>
          \oneVoice
          | e'4 e d2 |
        }

        c4 c
        <<
        { g' g | a4 a g2 }
        \\
        { e2 | f2 e }
        >>
        \oneVoice
        f4 f e e | d d c2 \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice \relative c, {
        \set midiInstrument = #"cello"
        \voiceOne
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

  \header { piece = "Hull a pelyhes (bev. cselló, 2 versszak), 2019v1" }
}
