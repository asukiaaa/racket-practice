#lang racket
(require racket/gui/base)

(define frame (new frame%
       [label "Example"]
       [width 300]
       [height 300]))

(define a-canvas (new canvas% [parent frame]
                      [paint-callback
                       (lambda (canvas dc)
                         (send dc set-scale 3 3)
                         (send dc set-text-foreground "blue")
                         (send dc draw-text "Don't Panic!" 0 0))]))

(send a-canvas set-canvas-background (make-object color% 100 255 100))

(send frame show #t)
