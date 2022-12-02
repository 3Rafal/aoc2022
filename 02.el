(defvar input
  (mapcar
   (lambda (x) (split-string x " "))
   (split-string
    (with-temp-buffer
      (insert-file-contents-literally "02.txt")
      (buffer-substring-no-properties (point-min) (point-max))) "\n")))

;;;; part 1

(defun selected-shape-score (rnd)
  (cond ((equal (cl-second rnd) "X") 1)
        ((equal (cl-second rnd) "Y") 2)
        ((equal (cl-second rnd) "Z") 3)
        (t 0)))

(defun round-outcome-score (rnd)
  (cond ((equal rnd '("A" "Y")) 6)
        ((equal rnd '("B" "Z")) 6)
        ((equal rnd '("C" "X")) 6)
        ((equal rnd '("A" "X")) 3)
        ((equal rnd '("B" "Y")) 3)
        ((equal rnd '("C" "Z")) 3)
        (t 0)))

(defun round-score (rnd)
  (+ (selected-shape-score rnd)
     (round-outcome-score rnd)))

(defvar part-1
  (apply '+ (mapcar 'round-score input)))

;;;; part 2

(defun i-draw (opp-choice)
  (cond ((equal opp-choice "A") "X")
         ((equal opp-choice "B") "Y")
         ((equal opp-choice "C") "Z")))

(defun i-win (opp-choice)
  (cond ((equal opp-choice "A") "Y")
         ((equal opp-choice "B") "Z")
         ((equal opp-choice "C") "X")))

(defun i-lose (opp-choice)
  (cond ((equal opp-choice "A") "Z")
         ((equal opp-choice "B") "X")
         ((equal opp-choice "C") "Y")))

(defun selected-shape (rnd)
  (cond ((equal (cl-second rnd) "X") (i-lose (cl-first rnd)))
        ((equal (cl-second rnd) "Y") (i-draw (cl-first rnd)))
        ((equal (cl-second rnd) "Z") (i-win (cl-first rnd)))))

(defun round-outcome-score-2 (rnd)
  (cond ((equal (cl-second rnd) "X") 0)
        ((equal (cl-second rnd) "Y") 3)
        ((equal (cl-second rnd) "Z") 6)
        (t 0)))

(defun selected-shape-score-2 (shape)
  (cond ((equal shape "X") 1)
        ((equal shape "Y") 2)
        ((equal shape "Z") 3)
        (t 0)))

(defun round-score-2 (rnd)
  (+ (selected-shape-score-2 (selected-shape rnd))
     (round-outcome-score-2 rnd)))

(defvar part-2
  (apply '+ (mapcar 'round-score-2 input)))

