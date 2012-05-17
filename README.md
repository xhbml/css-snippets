css-functions
=============

A collection of functions for outputting css code in Emacs

Philosohpy
----------

When working with CSS you often write the same code again and again. These functions are built to do some of the work for you. They will not guide you to 100% of what you want, that would take to many questions and complicate the code. It aims more towards ~90%, the rest is done just as efficiently by you since you are already using a pretty good editor.


Naming conventions
------------------

Function names start with cssf- (not css-) to separate them from whatever css-mode you might be using.


Documentation
--------

### M-x cssf-multicol

Outputs css code for multiple columns, use html code like this (four columns in this example)
<div class="multicol four">
	<div class="col"></div>
	<div class="col"></div>
	<div class="col"></div>
	<div class="col"></div>
</div>

The html and css code is explained here:
http://www.cssviking.com/multiple-columns-css


### M-x cssf-gradient

Outputs css code for a two-color vertical gradient (W3C standard + vendor-prefixed code for Mozilla, IE (>=10), Opera and Webkit), takes two arguments (start and stop color).