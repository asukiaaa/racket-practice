#!/usr/bin/env racket
#lang racket

(define (extract str)
  (substring str 4 10))

(extract "The person comes from Japan")
