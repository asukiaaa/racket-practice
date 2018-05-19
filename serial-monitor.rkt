#lang racket
(require libserialport)

(define ports (serial-ports))
(define opened-in-port null)
(define opened-out-port null)
(define buffer-size 20000)
(define read-buffer (make-bytes buffer-size))

(define (read-port port)
  (let loop ()
    (define read-result (read-bytes-avail!* read-buffer port))
    (cond [(or (eof-object? read-result)
               (and (number? read-result) (not (= read-result 0))))
           (display (bytes->string/utf-8 (read-bytes read-result port)))
           (display "")] ; flash output
          [else (sleep 0.1)])
    (loop)))

#;
(with-handlers ([exn:break? (lambda (x) (display "nothing from port"))])
  (read-bytes-avail!/enable-break read-buffer port))

(unless (empty? ports)
  (let ([port-name (list-ref ports 0)])
    (write port-name)
    (define-values (in out) (open-serial-port port-name #:baudrate 115200))
    (write "opened")
    (set! opened-in-port in)
    (set! opened-out-port out)
    ; write "hi" after 1 second
    (sleep 1)
    (write-bytes-avail (string->bytes/utf-8 "hi") opened-out-port)
    ;(read-port opened-in-port)
    (read-port in)))
