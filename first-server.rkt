#!/usr/bin/env racket
#lang racket
(require web-server/servlet)
(require web-server/servlet-env)

#;
(define (request-handler request)
  (response/full
   200                  ; HTTP response code.
   #"OK"                ; HTTP response message.
   (current-seconds)    ; Timestamp.
   TEXT/HTML-MIME-TYPE  ; MIME type for content.
   '()                  ; Additional HTTP headers.
   (list                ; Content (in bytes) to send to the browser.
    #"<h1>Hello!</h1>"
    #"<p>It's a great day!</p>")))

(define (request-handler request)
  (response/full
  200
  #"OK"
  (current-seconds)
  TEXT/HTML-MIME-TYPE
  '()
  (list
   #"<h1>Hello Web World</h1>"
   #"<p>From a server written in racket</p>")))

;; Start the server.
(serve/servlet
 request-handler
 #:launch-browser? #f
 #:quit? #f
 #:listen-ip "127.0.0.1"
 #:port 8001
 #:servlet-regexp #rx"first-page")
