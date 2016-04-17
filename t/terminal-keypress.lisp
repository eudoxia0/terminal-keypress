(in-package :cl-user)
(defpackage terminal-keypress-test
  (:use :cl :fiveam)
  (:export :run-tests))
(in-package :terminal-keypress-test)

(def-suite tests
  :description "terminal-keypress tests.")
(in-suite tests)

(test simple-test
  (is
   (equal 1 1))
  (is-true
   (and t t)))

(defun run-tests ()
  (run! 'tests))
