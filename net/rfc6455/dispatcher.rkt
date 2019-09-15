#lang racket/base

(require (prefix-in dispatch-sequencer: web-server/dispatchers/dispatch-sequencer))
(require "hybi00/dispatcher.rkt")
(require "rfc6455/dispatcher.rkt")

(provide make-general-websockets-dispatcher)

(define (make-general-websockets-dispatcher conn-dispatch [conn-headers #f])
  (dispatch-sequencer:make
   (make-rfc6455-dispatcher conn-dispatch conn-headers)
   (make-hybi00-dispatcher conn-dispatch conn-headers)))
