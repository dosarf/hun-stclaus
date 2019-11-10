\version "2.12.3"

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
      c4 c | c8 g8 c4 |
      c  f | g g |
      c4 c | c8 g8 c4 |
      c  f | g g |
      c4 c | c8 g8 c4 |
      c  f | g g |
      a4:m a:m | a8:m g8 c4 |
      c  f | g g |
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
        \time 2/4
        c'8 c c c | c d e4 |
        e8 e f e | d4 d |
        c8 c c c | c d e4 |
        e8 e f e | d4 d |
        c8 c c c | c d e4 |
        e8 e f e | d4 d |
        c8 c c c | c d e4 |
        e8 e f e | d4 d \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \new Voice {
        \relative c' {
          \set midiInstrument = #"acoustic guitar (nylon)"
          \voiceOne
          \clef treble
          \key c \major
          \time 2/4
          c'8 c c c | c d e4 |
          e8 e f e | d4 d |
          c8 c c c | c d e4 |
          e8 e f e | d4 d |
          c8 c c c | c d e4 |
          e8 e f e | d4 d |
          c8 c c c | c d e4 |
          e8 e f e | d4 d \bar "||"
        }
      }
      \new Voice {
        \relative c' {
          \set midiInstrument = #"acoustic guitar (nylon)"
          \voiceTwo
          \clef treble
          \key c \major
          \time 2/4
          e2 | g4 c |
          c4 a4 | g4 g |
          e2 | g4 c |
          c4 a4 | g4 g |
          e2 | g4 c |
          c4 a4 | g4 g |
          e2 | a4 c |
          c4 a4 | g4 g |
        }
      }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice
      { \relative c' {
        \set midiInstrument = #"cello"
        \voiceOne
        \clef bass
        \key c \major
        \time 2/4
        g8 f e4 | e8 g c4 |
        c4 f, | g4 g |
        g8 f e4 | e8 g c4 |
        c4 f, | g4 g |
        g8 f e4 | e8 g c4 |
        c4 f, | g4 g |
        a8 g a4 | a8 g c4 |
        c4 f, | g4 g |
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
      tempoWholesPerMinute = #(ly:make-moment 60 4)
    }
  }

  \header { piece = "Betemetett a nagy hó (nincs bev., 2x), 2019v1" }
}
