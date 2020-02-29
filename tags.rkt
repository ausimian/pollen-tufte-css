#lang racket/base

(require pollen/decode txexpr)
(require pollen/tag)

(provide title
         subtitle
         heading
         subheading
         blockquote
         epigraph
         sn mn)

(define-tag-function (title attrs elems)
  `(h1 ,attrs ,@elems))

(define-tag-function (subtitle attrs elems)
  `(p ,(cons '(class "subtitle") attrs) ,@elems))

(define-tag-function (heading attrs elems)
  `(h2 ,attrs ,@elems))

(define-tag-function (subheading attrs elems)
  `(h3 ,attrs ,@elems))

(define (blockquote #:author author #:source source #:href [href #f] . elems)
  `(blockquote ,(if href `((cite ,href)) empty)
               ,@elems
               (footer ,(string-append author ", ")
                       ,(if href `(a ((href ,href)) (cite ,source)) `(cite ,source)))))

(define (epigraph #:author author #:source source #:href [href #f] . elems)
  `(div ((class "epigraph")) ,(apply blockquote elems #:author author #:source source #:href href)))

(define (sn . elems)
  (let ([id (symbol->string (gensym "sn-"))])
    `(span (label ((for ,id) (class "margin-toggle sidenote-number")))
           (input ((type "checkbox") (id ,id) (class "margin-toggle")))
           (span ((class "sidenote")) ,@elems))))

(define (mn . elems)
  (let ([id (symbol->string (gensym "mn-"))])
    `(span (label ((for ,id) (class "margin-toggle")) "⊕")
           (input ((type "checkbox") (id ,id) (class "margin-toggle")))
           (span ((class "marginnote")) ,@elems))))
