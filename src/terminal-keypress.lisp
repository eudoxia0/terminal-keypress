(in-package :cl-user)
(defpackage terminal-keypress
  (:use :cl)
  (:import-from :alexandria
                :if-let)
  (:export :read-event)
  (:documentation "Reading keypresses."))
(in-package :terminal-keypress)

;;; Constants

(defconstant +escape+ (char-code #\Esc))

(defparameter +control-keys+
  (vector (cons 1  #\A)
          (cons 2  #\B)
          (cons 3  #\C)
          (cons 4  #\D)
          (cons 5  #\E)
          (cons 6  #\F)
          (cons 7  #\G)
          (cons 8  #\H)
          (cons 9  #\I)
          (cons 10 #\J)
          (cons 11 #\K)
          (cons 12 #\L)
          (cons 13 #\M)
          (cons 14 #\N)
          (cons 15 #\O)
          (cons 16 #\P)
          (cons 17 #\Q)
          (cons 18 #\R)
          (cons 19 #\S)
          (cons 20 #\T)
          (cons 21 #\U)
          (cons 22 #\V)
          (cons 23 #\W)
          (cons 24 #\X)
          (cons 25 #\Y)
          (cons 26 #\Z)
          (cons 27 #\[)
          (cons 28 #\\)
          (cons 29 #\])
          (cons 30 #\^)
          (cons 31 #\_)
          (cons 127 #\?)))

;;; Utilities

(defun read-raw-byte (&optional (stream *standard-input*))
  (trivial-raw-io:with-raw-io ()
    (read-byte stream)))

(defun control-key-p (byte)
  (find byte +control-keys+ :test #'= :key #'first))

;;; Data

(defstruct keypress
  "Represents a keypress."
  (bytes #() :type vector)
  (character #\Nul :type character)
  (control nil :type boolean)
  (escape nil :type boolean))

;;; Interface

(defun read-event (&key (stream *standard-input*))
  (let ((first-byte (read-raw-byte stream)))
    (if (= first-byte +escape+)
        ;; Escape key. Read the next characters.
        (let ((second-byte (read-raw-byte stream)))
          (if-let (pair (control-key-p second-byte))
            ;; Escaped control key
            (make-keypress :bytes (vector first-byte second-byte)
                           :character (rest pair)
                           :control t
                           :escape t)
             ;; Normal escaped key
            (make-keypress :bytes (vector first-byte second-byte)
                           :character (code-char second-byte)
                           :control nil
                           :escape t)))
        ;; Not a escape character
        (if-let (pair (control-key-p first-byte))
          ;; Control character
          (make-keypress :bytes (vector first-byte)
                         :character (rest pair)
                         :control t)
          ;; Normal characterk
          (make-keypress :bytes (vector first-byte)
                         :character (code-char first-byte))))))
