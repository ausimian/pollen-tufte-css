#lang racket/base

(require racket/string)
(require pollen/decode txexpr)
(require pollen/tag)

(provide prepare-article
         title
         subtitle
         section
         subheading
         blockquote
         epigraph
         sn mn)

(define side-note-id #f)
(define (next-side-note!)
  (set! side-note-id (add1 side-note-id))
  (format "sn-~a" side-note-id))

(define margin-note-id #f)
(define (next-margin-note!)
  (set! margin-note-id (add1 margin-note-id))
  (format "mn-~a" margin-note-id))

(define (prepare-article)
  (set! side-note-id 0)
  (set! margin-note-id 0))

(define (title . text)
  `(h1 ,(string-join text "")))

(define (subtitle . text)
  `(p ((class "subtitle")) ,@text))

(define (section #:heading [heading #f] . elems)
  (if heading
      `(section (h2 ,heading) ,@elems)
      `(section ,@elems)))

(define (subheading . text)
  `(h3 ,@text))

(define (blockquote #:author author #:source source #:href [href #f] . elems)
  `(blockquote ,(if href `((cite ,href)) empty)
               ,@elems
               (footer ,(string-append author ", ")
                       ,(if href `(a ((href ,href)) (cite ,source)) `(cite ,source)))))

(define (epigraph #:author author #:source source #:href [href #f] . elems)
  `(div ((class "epigraph")) ,(apply blockquote elems #:author author #:source source #:href href)))

(define (sn . elems)
  (let ([id (next-side-note!)])
    `(span (label ((for ,id) (class "margin-toggle sidenote-number")))
           (input ((type "checkbox") (id ,id) (class "margin-toggle")))
           (span ((class "sidenote")) ,@elems))))

(define (mn . elems)
  (let ([id (next-margin-note!)])
    `(span (label ((for ,id) (class "margin-toggle")) "⊕")
           (input ((type "checkbox") (id ,id) (class "margin-toggle")))
           (span ((class "marginnote")) ,@elems))))
