(require-extension tcp-server posix)
(use posix)

;;(define (read-tpkt socket))

(define (run)
  (write-line (seconds->string (current-seconds)))
  (let-values (((server-input-port server-output-port) (tcp-connect "10.0.3.167" 3389)))
    (let ((client-file (port->fileno (current-input-port)))
          (server-file (port->fileno server-input-port)))
      (write-line (format "client-file: ~S, server-file: ~S"
                          client-file server-file)))))

((make-tcp-server 
  (tcp-listen 3390) 
  run)
 #t)
;;      (let-values (((readers writers) (file-select (list input-fileno) #f 10)))
;;        (if (memq input-fileno reader-filenos)
;;            (let ((line (read-line (current-input-port))))
;;              (write-line (format "line: ~S" line)))
;;            (write-line "no line read!"))))
;;    (write-line (seconds->string (current-seconds)))))
;; #t)
