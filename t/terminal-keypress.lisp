(in-package :cl-user)
(defpackage terminal-keypress-test
  (:use :cl :fiveam)
  (:export :run-tests))
(in-package :terminal-keypress-test)

(def-suite tests
  :description "terminal-keypress tests.")
(in-suite tests)

(defun run-tests ()
  (run! 'tests))
