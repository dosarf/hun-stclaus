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
     r2 | r2 |
     r2 | r2 |
     r2 | r2 |
     r2 | r2 |

     c2 | d4:m g |
     c2 | d4:m g |
     c4 c:7 | f2 |
     g2 | c2
    } }
    \new Staff \with {
      instrumentName = #"Violin"
      shortInstrumentName = #"V"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \voiceOne
        \clef treble
        \key c \major
        \time 2/4
        g''4 e | f8 e d4\fermata |
        r2 | r2 | \break
        r2 | r2 |
        g8 e d4 | c4 c

        \repeat volta 2 {
          g'4 e | f8 e d4 |
          g8 g e g | f8 e d4
          e8 f g4 | a a |
          g8 e d4 | c4 c
        }
      }

    >>

    \new Staff \with {
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \new Voice { \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        %\voiceOne
        \clef treble
        \key c \major
        \time 2/4
        r2 | r2 |
        r2 | r2 |
        <<
          { c'8 d e4 | f4 f\fermata |
            b,8 b r4 | g4 g4 |
          }
          \\
          { e8 f g4 | a4 a |
            g8 g g,4 | c4 c |
          }
        >>
        \oneVoice

        \repeat volta 2 {
          <<
            { e'4 c | f8 (e) d4 |
              e4 c | f8 (e) d4 |
              c8 d e4 | f4 f |
              b,8 b r4 | g4 g4 |
            }
            \\
            { r8 g8 r g | r4 r8 g |
              r8 g8 r g | r4 r8 g |
              e8 f g4 | a4 a |
              g8 g g,4 | c4 c |
            }
          >>
        }

      } }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice { \relative c' {
        \set midiInstrument = #"cello"
        %\voiceOne
        \clef bass
        \key c \major
        \time 2/4
        r2 | r2 |
        g8 g e g | f8 e d4\fermata |
        r2 | r2 |
        d4 g, | c4 c

        \repeat volta 2 {
        c4 e | d4 g |
        c,4 e | d4 g |
        c,4 c | f4 f |
        d4 g, | c4 c }
      } }
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

  \header { piece = "Nótás Mikulás (3x dallam, legvégén utolsó 4 ütem), 2019v3" }

}
