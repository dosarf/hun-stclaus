\version "2.18.2"

\paper{
  indent=0\mm
  line-width=120\mm
  oddFooterMarkup=##f
  %oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  %scoreTitleMarkup = ##f
}

guitarSymbols = {
    \time 2/4
    f8 <c' f> e, <c' e> | d, <c' f> c, <c' f> |
    a, <a' c> bes, <bes' d> | c, <g' e'> <f, a' f'>4
}


\score {
  <<
    \context ChordNames { \chordmode {
      f4 a:m/e | d:m7 f/c | a:m bes | c f
    } }
    \new Staff \with {
      instrumentName = #"Violin/Recorder"
      shortInstrumentName = #"V/R"
    } <<
      \new Voice \relative c' {
        \set midiInstrument = #"violin"
        \clef treble
        \key f \major
        \time 2/4
        c'8 c16 c c8 c | c a f4 |
        a8 a g f | g a f4 \bar "||"
      }
    >>

    \new Staff \with {
      instrumentName = #"Guitar"
      shortInstrumentName = #"G"
    } <<
      \new Voice {  \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        \clef treble
        \key f \major
        \time 2/4
        a'8 a16 a a8 a | a f c4 |
        e8 e d d | e8 e c4 \bar "||"
      } }
    >>

    \new Staff \with {
      instrumentName = #"Cello"
      shortInstrumentName = #"C"
    } <<
      \new Voice {  \relative c {
        \set midiInstrument = #"cello"
        \clef bass
        \key f \major
        \time 2/4
        f4 e | d4 c |
        a4 bes | c4 f \bar "||"
      } }
    >>

    \new Staff \with {
      instrumentName = #"Guitar #2"
      shortInstrumentName = #"G2"
    } <<
      \new Voice {  \relative c' {
        \set midiInstrument = #"acoustic guitar (nylon)"
        \clef treble
        \key f \major
        \guitarSymbols
      } }
    >>

   \new TabStaff { \relative c \guitarSymbols }


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

  \header { piece = "Suttog a fenyves (bev.: furulya versszak, 6x), 2019v1" }
}
