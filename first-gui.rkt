#lang racket
(require racket/gui/base)

(define frame (new frame% [label "First GUI App"]))
(define msg (new message% [parent frame]
                 [label "Nothing"]))

(new button% [parent frame]
     [label "Click Me"]
     [callback (lambda (button event)
                 (send msg set-label "Button was clicked"))])

(define my-canvas%
  (class canvas%
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    (super-new)))

(new my-canvas% [parent frame])

(new button% [parent frame]
     [label "Pause"]
     [callback (lambda (button event) (sleep 5))])

(define panel (new horizontal-panel% [parent frame]))
(new button% [parent panel]
     [label "Left"]
     [callback (lambda (button event)
                 (send msg set-label "Left click"))])
(new button% [parent panel]
     [label "Right"]
     [callback (lambda (button event)
                 (send msg set-label "Right click"))])

(send frame show #t)
