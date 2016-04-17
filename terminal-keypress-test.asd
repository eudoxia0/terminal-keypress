(defsystem terminal-keypress-test
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :depends-on (:terminal-keypress
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "terminal-keypress")))))
