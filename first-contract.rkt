#lang racket

(provide (contract-out [amount (and/c number? positive?)]))

(define amount "hi")
