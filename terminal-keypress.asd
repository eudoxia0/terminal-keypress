(defsystem terminal-keypress
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :maintainer "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage "https://github.com/eudoxia0/terminal-keypress"
  :bug-tracker "https://github.com/eudoxia0/terminal-keypress/issues"
  :source-control (:git "https://github.com/eudoxia0/terminal-keypress.git")
  :depends-on (:trivial-raw-io
               :alexandria)
  :components ((:module "src"
                :serial t
                :components
                ((:file "terminal-keypress"))))
  :description "Read keypresses from the terminal."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op terminal-keypress-test))))
