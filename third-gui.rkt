#lang racket
(require racket/gui/base)

(define dialog (instantiate dialog% ("Example")
                 [stretchable-width #t]))
(define field (new text-field% [parent dialog] [label "Your name"]))
(define field-editor (send field get-editor))
(define panel (new horizontal-panel% [parent dialog]
                   [alignment '(center center)]))
(define msg (new message% [parent dialog]
                 [label "Nothing"]
                 [stretchable-width #t]))
(send msg show #f)

(new button% [parent panel]
     [label "Cancel"]
     [callback (lambda (button event)
                 (send field-editor erase))])
(new button% [parent panel]
     [label "Ok"]
     [callback (lambda (button event)
                 (define name-text (send field-editor get-text))
                 (send field show #f)
                 (send panel show #f)
                 (send msg set-label (string-append "Hello " name-text " (^-^)"))
                 (send msg show #t)
                 (send msg auto-resize))])
(when (system-position-ok-before-cancel?)
  (send panel change-children reverse))

(send dialog show #t)
