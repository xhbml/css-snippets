
(defun insert-and-indent (text)
	"Insert some text and then indent it automatically"
	(let ((old-pnt (point)))
		(insert text)
		(let ((new-pnt (point)))
			(indent-region old-pnt new-pnt))))
	
;; Sjekk om indent-region kan brukes for å indentere koden
;;  (newline-and-indent) 
;; evt. finn funksjon som gjør det
(defun cssf-gradient ( start stop)
	"Returns CSS code for a two-color vertical gradient"
	(interactive "sStart color: \nsStop color:")
	(save-excursion 
		(insert-and-indent (format "
background-image: -o-linear-gradient(%s, %s); /* Opera */
background-image: -moz-linear-gradient(%s, %s); /* Mozilla */
background-image: -ms-linear-gradient(%s, %s); /* IE 10 */
background-image: -webkit-linear-gradient(%s, %s); /* Chrome, Safari */
background-image: linear-gradient(%s, %s); /* W3C standard */
" start stop start stop start stop start stop start stop ))))

(defun cssf-multicol (number width spacing)
	"CSS code for multiple columns"
	(interactive "nHow many columns (3-9): \nsColumn width (%%, px, em etc.. default 22%%): \nsColumn spacing (%%, px, em etc.. default 4%%):")
	(if (string= "" width) (setq width "22%%"))
	(if (string= "" width) (setq spacing "4%%"))

	(let ((numtable '((3 "three") 
										(4 "four")
										(5 "five")
										(6 "six")
										(7 "seven")
										(8 "eight")
										(9 "nine"))))
		(let ((word (nth 1 (assoc number numtable))))
			(save-excursion 
				(insert (format "
/* general */
.col {
	float: left;
}
/* general %s-column */
.multicol.%s .col {
	margin-right: %s;
	width: %s;
}
/* first column */
.multicol.%s .col:nth-child(%sn-%s) {
	clear: both;
}

/* second last column */
.multicol.%s .col:nth-child(%sn-1) {
	margin-right: 0;
}
/* last column */

.multicol.%s .col:nth-child(%sn) {
	clear: right; /* avoids some old ie problems */
	float: right;
	margin-right: 0;
}
" word word width spacing word number (- number 1) word number word number))))))

