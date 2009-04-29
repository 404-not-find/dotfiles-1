" Vim filetype plugin file
" Language:	 XHTML Basic
" Maintainer:	 Alan Isaac 
" Last Modified:  15th October 2002

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" HTML comment formatting  (doesn't work yet)
"setlocal comments=sb:<!--,m:   ,ex:-->
"setlocal formatoptions-=t formatoptions+=rol

" Define patterns for the matchit macro
if !exists("b:match_words")
  let b:match_ignorecase = 1
  let b:match_words = '<p>:</p>,<div>:</div>,<ol>:</ol>,<ul>:</ul>'
endif

set cpo-=C

" Define patterns for the browse file filter
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "HTML Files (*.htm)\t*.htm\n" .
    \ "HTML Files (*.html)\t*.html\n" .
    \ "All Files (*.*)\t*.*\n"
endif

" Reminder: XHTML Basic allows only the following elements
"   http://www.w3.org/TR/xhtml-basic/#s_xhtmlmodules
"   (there is no style element or attribute in Basic; use link)
" Structure Module*
" body, head, html, title
" Text Module*
" abbr, acronym, address, blockquote, br, cite, code, dfn, div, em,
"     h1, h2, h3, h4, h5, h6, kbd, p, pre, q, samp, span, strong, var
" Hypertext Module*
" a
" List Module*
" dl, dt, dd, ol, ul, li
" Basic Forms Module  (not implemented here)
" form, input, label, select, option, textarea
" Basic Tables Module
" caption, table, td, th, tr
" Image Module
" img
" Object Module   (not implemented here)
" object, param
" Metainformation Module
" meta
" Link Module
" link
" Base Module  (not implemented here)
" base


" document type declarations
" XHTML Basic 1.0 http://www.w3.org/TR/xhtml-basic/
inoremap <buffer> <unique> <xb <esc>ggO<lt>?xml version="1.0" encoding="iso-8859-1"?><cr><lt>html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="en-US" ><esc>O<lt>!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.0//EN"<cr>   "http://www.w3.org/TR/xhtml-basic/xhtml-basic10.dtd" ><esc>j
" XHTML 1.0 Strict http://www.w3.org/TR/xhtml1/
inoremap <buffer> <unique> <xs <esc>ggO<lt>?xml version="1.0" encoding="iso-8859-1"?><cr><lt>html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="en-US"><esc>O<lt>!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"<cr>  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><esc>j


" root element
" inoremap <buffer> <unique> <ht <lt>html><cr><lt>head><cr><lt>title>_title<lt>/title><cr><lt>/head><cr><lt>body><cr><lt>/body><cr><lt>/html><esc>kO
inoremap <buffer> <unique> <ht <c-r>="<html>\n<head>\n<title>".input("title:")."</title>\n</head>\n<body>\n</body>\n</html>"<cr>

" heading h1|h2|h3|h4|h5|h6
inoremap <buffer> <unique> <h1 <c-r>="<h1>".input("text:")."</h1>"<cr>
vnoremap <buffer> <unique> <h1 "xc<lt>h1><cr><lt>/h1><esc>"xP
inoremap <buffer> <unique> <h2 <c-r>="<h2>".input("text:")."</h2>"<cr>
vnoremap <buffer> <unique> <h2 "xc<lt>h2><cr><lt>/h2><esc>"xP
inoremap <buffer> <unique> <h3 <c-r>="<h3>".input("text:")."</h3>"<cr>
vnoremap <buffer> <unique> <h3 "xc<lt>h3><cr><lt>/h3><esc>"xP
inoremap <buffer> <unique> <h4 <c-r>="<h4>".input("text:")."</h4>"<cr>
vnoremap <buffer> <unique> <h4 "xc<lt>h4><cr><lt>/h4><esc>"xP
inoremap <buffer> <unique> <h5 <c-r>="<h5>".input("text:")."</h5>"<cr>
vnoremap <buffer> <unique> <h5 "xc<lt>h5><cr><lt>/h5><esc>"xP
inoremap <buffer> <unique> <h6 <c-r>="<h6>".input("text:")."</h6>"<cr>
vnoremap <buffer> <unique> <h6 "xc<lt>h6><cr><lt>/h6><esc>"xP

" List Module
" lists ul | ol | dl
inoremap <buffer> <unique> <ul <lt>ul><cr><lt>/ul><Esc>O
vnoremap <buffer> <unique> <ul "xc<lt>ul><c-r>x<lt>/ul>
nnoremap <buffer> <unique> <ul {o<lt>ul><esc>}O<lt>/ul><esc>
inoremap <buffer> <unique> <ol <lt>ol><cr><lt>/ol><Esc>O
vnoremap <buffer> <unique> <ol "xc<lt>ol><c-r>x<lt>/ol>
nnoremap <buffer> <unique> <ol {o<lt>ol><esc>}O<lt>/ol><esc>
inoremap <buffer> <unique> <dl <lt>dl><cr><lt>/dl><Esc>O
inoremap <buffer> <unique> <li <lt>li><cr><lt>/li><Esc>O
vnoremap <buffer> <unique> <li "xc<lt>li><cr><c-r>x<cr><lt>/li>
nnoremap <buffer> <unique> <li O<lt>li><esc>jo<lt>/li><esc>j
inoremap <buffer> <unique> <dt <lt>dt><cr><lt>/dt><Esc>O
inoremap <buffer> <unique> <dd <lt>dd><cr><lt>/dd><Esc>O

" Tables module
inoremap <buffer> <unique> <ta <lt>table><cr><lt>/table><esc>O
inoremap <buffer> <unique> <tr <lt>tr><cr><lt>/tr><esc>O
inoremap <buffer> <unique> <th <lt>th><cr><lt>/th><esc>O
inoremap <buffer> <unique> <td <lt>td><cr><lt>/td><esc>O
inoremap <buffer> <unique> <ca <c-r>="<caption>".input("caption:")."</caption>"<cr>

inoremap <buffer> <unique> <pr <lt>pre><cr><lt>/pre><Esc>O
inoremap <buffer> <unique> <ah <c-r>="<a href=\"".input("URL:")."\">".input("anchor text:")."</a>"<cr>
vnoremap <buffer> <unique> <ah "xc<lt>a href=""><c-r>x<lt>/a><esc>F"i<c-r>=input("URL:")<cr>
imap <buffer> <unique> ;a> <Esc>f>a

" phrase elements em | strong | dfn | code | q | sub | sup | samp | kbd | var | cite | abbr | acronym
inoremap <buffer> <unique> <em <c-r>="<em>".input("emphasized text:")."</em>"<cr>
vnoremap <buffer> <unique> <em "xc<lt>em><c-r>x<lt>/em>
nnoremap <buffer> <unique> <em "xciw<lt>em><c-r>x<lt>/em>
inoremap <buffer> <unique> <str <c-r>="<strong>".input("emphasized text:")."</strong>"<cr>
vnoremap <buffer> <unique> <str "xc<lt>strong><c-r>x<lt>/strong>
nnoremap <buffer> <unique> <str "xciw<lt>strong><c-r>x<lt>/strong>
inoremap <buffer> <unique> <df <c-r>="<dfn>".input("defined word:")."</dfn>"<cr>
vnoremap <buffer> <unique> <df "xc<lt>dfn><c-r>x<lt>/dfn>
nnoremap <buffer> <unique> <df "xciw<lt>dfn><c-r>x<lt>/dfn>
inoremap <buffer> <unique> <co <c-r>="<code>".input("inline code:")."</code>"<cr>
vnoremap <buffer> <unique> <co "xc<lt>code><c-r>x<lt>/code>
nnoremap <buffer> <unique> <co "xciw<lt>code><c-r>x<lt>/code>
inoremap <buffer> <unique> <q> <c-r>="<q>".input("inline quoted text:")."</q>"<cr>
vnoremap <buffer> <unique> <q> "xc<lt>q><c-r>x<lt>/q>
nnoremap <buffer> <unique> <q> "xciw<lt>q><c-r>x<lt>/q>
inoremap <buffer> <unique> <_  <c-r>="<sub>".input("subscript:")."</sub>"<cr>
vnoremap <buffer> <unique> <_  "xc<lt>sub><c-r>x<lt>/sub>
inoremap <buffer> <unique> <^  <c-r>="<sup>".input("superscript:")."</sup>"<cr>
vnoremap <buffer> <unique> <^  "xc<lt>sup><c-r>x<lt>/sup>
inoremap <buffer> <unique> <sa <c-r>="<samp>".input("sample output:")."</samp>"<cr>
vnoremap <buffer> <unique> <sa "xc<lt>samp><c-r>x<lt>/samp>
nnoremap <buffer> <unique> <sa "xciw<lt>samp><c-r>x<lt>/samp>
inoremap <buffer> <unique> <kb <c-r>="<kbd>".input("keyboard text:")."</kbd>"<cr>
vnoremap <buffer> <unique> <kb "xc<lt>kbd><c-r>x<lt>/kbd>
nnoremap <buffer> <unique> <kb "xciw<lt>kbd><c-r>x<lt>/kbd>
inoremap <buffer> <unique> <va <c-r>="<var>".input("var name:")."</var>"<cr>
vnoremap <buffer> <unique> <va "xc<lt>var><c-r>x<lt>/var>
nnoremap <buffer> <unique> <va "xciw<lt>var><c-r>x<lt>/var>
inoremap <buffer> <unique> <ci <c-r>="<cite>".input("cite:")."</cite>"<cr>
vnoremap <buffer> <unique> <ci "xc<lt>cite><c-r>x<lt>/cite>
inoremap <buffer> <unique> <ab <c-r>="<abbr>".input("abbreviation:")."</abbr>"<cr>
vnoremap <buffer> <unique> <ab "xc<lt>abbr><c-r>x<lt>/abbr>
nnoremap <buffer> <unique> <ab "xciw<lt>abbr><c-r>x<lt>/abbr>
inoremap <buffer> <unique> <ac <c-r>="<acronym>".input("acronym:")."</acronym>"<cr>
vnoremap <buffer> <unique> <ac "xc<lt>acronym><c-r>x<lt>/acronym>
nnoremap <buffer> <unique> <ac "xciw<lt>acronym><c-r>x<lt>/acronym>

" structural elements
" inline
inoremap <buffer> <unique> <sp <c-r>="<span>".input("span:")."</span>"<cr>
vnoremap <buffer> <unique> <sp "xc<lt>span><c-r>x<lt>/span>
inoremap <buffer> <unique> <br <cr><lt>br />
" block
inoremap <buffer> <unique> <p> <lt>p><cr><lt>/p><Esc>O
vnoremap <buffer> <unique> <p> "xc<lt>p><c-r>x<lt>/p>
nnoremap <buffer> <unique> <p> {o<lt>p><esc>}O<lt>/p><esc>
inoremap <buffer> <unique> <di <lt>div><cr><lt>/div><Esc>O
inoremap <buffer> <unique> <ad <lt>address><cr><lt>/address><Esc>O
inoremap <buffer> <unique> <bl <lt>blockquote><cr><lt>/blockquote><Esc>O

" fontstyle elements: tt | i | b | big | small (in XHTML but not XHTML Basic)
inoremap <buffer> <unique> <i> <c-r>="<em>".input("italicized text:")."</em>"<cr>
vnoremap <buffer> <unique> <i> "xc<lt>em><c-r>x<lt>/em>
nnoremap <buffer> <unique> <i> "xciw<lt>em><c-r>x<lt>/em>
inoremap <buffer> <unique> <b> <c-r>="<strong>".input("bold text:")."</strong>"<cr>
vnoremap <buffer> <unique> <b> "xc<lt>strong><c-r>x<lt>/strong>
nnoremap <buffer> <unique> <b> "xciw<lt>strong><c-r>x<lt>/strong>
inoremap <buffer> <unique> <tt <c-r>="<tt>".input("typewriter text:")."</tt>"<cr>
vnoremap <buffer> <unique> <tt "xc<lt>tt><c-r>x<lt>/tt>
nnoremap <buffer> <unique> <tt "xciw<lt>tt><c-r>x<lt>/tt>

" image
inoremap <buffer> <unique> <im <c-r>="<img src=\"".input("filename:")."\" alt=\"".input("file description:")."\" />"<cr>

" meta (for author, comma separated keywords, and sentence description)
inoremap <buffer> <unique> <ma <c-r>="  <meta name=\"author\" content=\"".input("author name:")."\" />"<cr>
inoremap <buffer> <unique> <mk <c-r>="  <meta name=\"keywords\" content=\"".input("keywords:")."\" />"<cr>
inoremap <buffer> <unique> <md <c-r>="  <meta name=\"description\" content=\"".input("description:")."\" />"<cr>

" link
" link to an external CSS style sheet
inoremap <buffer> <unique> <ls <c-r>="<link rel=\"stylesheet\" type=\"text/css\" href=\"".input("style file URL:")."\" />"<cr>

" extras (for elements not in XHTML Basic)
inoremap <buffer> <unique> <sty <lt>style><lt>!--<cr>--><lt>/style><esc>O
inoremap <buffer> <unique> <in <c-r>='<lt>ins>'.input("inserted text:").'</ins>'<cr>
vnoremap <buffer> <unique> <in "xc<lt>ins><c-r>x<lt>/ins>
inoremap <buffer> <unique> <de <c-r>='<lt>del>'.input("deleted text:").'</del>'<cr>
vnoremap <buffer> <unique> <de "xc<lt>del><c-r>x<lt>/del>

" extras (for elements not in XHTML)
inoremap <buffer> <unique> <u> <c-r>="<span style='text-decoration: underline;'>".input("underlined text:").'</span>'<cr>
vnoremap <buffer> <unique> <u> "xc<lt>span<space>style="text-decoration:underline;"><c-r>x<lt>/span>

" easy add
" new div
inoremap <buffer> <unique> <nv <lt>/div><cr><cr><lt>div><cr>
" new p
inoremap <buffer> <unique> <np <lt>/p><cr><cr><lt>p><cr>
" new li
inoremap <buffer> <unique> <ni <cr><lt>/li><cr><lt>li><cr>
" new tr
inoremap <buffer> <unique> <nr <lt>/tr><cr><lt>tr><cr>
" new td
inoremap <buffer> <unique> <nd <lt>/td><cr><lt>td><cr>

" other stuff
" unmark
noremap <buffer> <unique> <un ?<lt><cr>df>/<lt><cr>df>b
"comments
inoremap <buffer> <unique>  <! <esc>0i<!--<space><esc>A<space>--><esc>3hi
vnoremap <buffer> <unique> <! "xc<lt>!--<cr><c-r>x-->
