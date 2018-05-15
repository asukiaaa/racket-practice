#lang racket
(require libserialport)

(define ports (serial-ports))
(define opened-in-port null)
(define opened-out-port null)
;(define buffer-size 10)
(define buffer-size 20000)
(define read-buffer (make-bytes buffer-size))

(define (read-port port)
  (let loop ()
    (display "") ; flash output
    (print "loop")
    (define read-result (read-bytes-avail!* read-buffer port))
    (print read-result)
    (cond [(or (eof-object? read-result)
               (and (number? read-result) (= read-result 0)))
           ;(print "byte string")
           ;(print (bytes->string/utf-8 read-buffer))
           (read-bytes 1 port)]
          [else
           (loop)]))
  #;
  (if (not (equal? 0 (read-bytes-avail!* read-buffer port)))
      (begin
        (print "empty")
        (read-port port))
      (begin
        (print "available")
        (write read-buffer))))

(unless (empty? ports)
  (let ([port-name (list-ref ports 0)])
    (write port-name)
    (define-values (in out) (open-serial-port port-name))
    (write "opened")
    (set! opened-in-port in)
    (set! opened-out-port out)
    ; write "hi" after 1 second
    (sleep 1)
    (write-bytes-avail (string->bytes/utf-8 "hi") opened-out-port)
    (read-port opened-in-port)))
