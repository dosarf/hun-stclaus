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
      instrumentName = #"Violin"
      shortInstrumentName = #"V"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \clef treble
        \key c \major
        \time 2/4
        c'8 c c c | c d e4 |
        e8 e f e | d4 d | \break
        c8 c c c | c d e4 |
        e8 e f e | d4 d | \break
        c8 c c c | c d e4 |
        e8 e f e | d4 d | \break
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
          c'4 c | c8 (b) c4 |
          <e c>4 f8 (e) | d4 b |
          c4 c | c8 (b) c4 |
          <e c>4 f8 (e) | d4 b |
          c4 c | c8 (b) c4 |
          <e c>4 f8 (e) | d4 b |
          c4 c | c8 (b) c4 |
          <e c>4 f8 (e) | d4 b \bar "||"
        }
      }
      \new Voice {
        \relative c' {
          \set midiInstrument = #"acoustic guitar (nylon)"
          \voiceTwo
          \clef treble
          \key c \major
          \time 2/4
          r8 g' r g | r4 r8 g |
          r8 g r4 | r8 g r g |
          r8 g r g | r4 r8 g |
          r8 g r4 | r8 g r g |
          r8 g r g | r4 r8 g |
          r8 g r4 | r8 g r g |
          r8 a r a | r4 r8 g |
          r8 g r4 | r8 g r g |
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

  \header { piece = "Betemetett a nagy hó (nincs bev., 2x), 2019v4" }
}
