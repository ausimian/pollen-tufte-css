#lang scribble/manual
@require[@for-label[pollen-tufte-css
                    racket/base]]

@title{pollen-tufte-css}
@author[(author+email "Nick Gunn" "nick@ausimian.net")]

@defmodule[pollen-tufte-css]

A small set of tag functions intended to support the generation of web pages under @link["https://docs.racket-lang.org/pollen/"]{@italic{Pollen}}, styled via @link["https://edwardtufte.github.io/tufte-css/"]{@italic{Tufte CSS}}.

@local-table-of-contents[]

@defproc[
(title [elem any/c] ...) any/c]
Produces an @tt{h1} element with the content specifed by the provided @racket[elem]s.

@defproc[
(subtitle [elem any/c] ...) any/c]
Produces a @tt{p} element of class @tt{subtitle} with the content specifed by the provided @racket[elem]s.

@defproc[
(heading [elem any/c] ...) any/c]
Produces an @tt{h2} element with the content specifed by the provided @racket[elem]s.

@defproc[
(subheading [elem any/c] ...) any/c]
Produces an @tt{h3} element with the content specifed by the provided @racket[elem]s.

@defproc[
(blockquote
 [#:author author any/c]
 [#:source source any/c]
 [#:href   href   any/c #f]
 [elem any/c] ...) any/c] 
Produces a @tt{blockquote} element with the @racket[elem]s as the content of the quotation.

The blockquote has an inner @tt{footer} that contains the author and the source within a @tt{cite} element. In addition if an @racket[href] is provided, the @tt{cite} will be linked to the value of @racket[href].


@defproc[
(epigraph
 [#:author author any/c]
 [#:source source any/c]
 [#:href   href   any/c #f]
 [elem any/c] ...) any/c] 
Produces a @tt{blockquote} within a @tt{div} of class @tt{epigraph}. See @racket[blockquote] for element details.


@defproc[
(sn [elem any/c] ...) any/c]
Produces a sidenote with the content specifed by the provided @racket[elem]s. 


@defproc[
(mn [elem any/c] ...) any/c]
Produces a margin-note with the content specifed by the provided @racket[elem]s. 

