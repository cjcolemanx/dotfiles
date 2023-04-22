" Vim syntax file
" Language: Kanata config file
" Maintainer: n/a
" Latest Revision: 04 April 2023

" Description
"   EXTREMELY basic, just for easier parsing

if exists("b:current_syntax")
  finish
endif

"-----------------------------------------------------------------------------
" Keywords
syn keyword kanataLanguageKeywords defsrc       deflayer      defvar 
syn keyword kanataLanguageKeywords defcfg       defoverrides  defalias
syn keyword kanataLanguageKeywords deffakekeys  defseq        defchords

"-----------------------------------------------------------------------------
" Common Commands
syn keyword kanataCommandName lrld                     lrd-prev                   lrd-next 
syn keyword kanataCommandName lrpv                     lrnx                       layer-switch 
syn keyword kanataCommandName layer-while-held         layer-toggle               release-layer 
syn keyword kanataCommandName release-key              rpt                        multi 
syn keyword kanataCommandName tap-dance                tap-dance-eager            one-shot-press 
syn keyword kanataCommandName one-shot-release         one-shot-press-pcancel     one-shot-release-pcancel
syn keyword kanataCommandName tap-hold tap-hold-press  tap-hold-release           tap-hold-release-keys
syn keyword kanataCommandName tap-hold-press-timeout   tap-hold-release-timeout   macro                   
syn keyword kanataCommandName dynamic-macro-record     dynamic-macro-record-stop  dynamic-macro-record-stop-truncate 
syn keyword kanataCommandName dynamic-macro-play       fork                       caps-word 
syn keyword kanataCommandName cmd                      cmd-output-keys            arbitrary-code 
syn keyword kanataCommandName unicode                  on-press-fakekey           on-release-fakekey
syn keyword kanataCommandName on-press-fakekey-delay   on-release-fakekey-delay   sldr
syn keyword kanataCommandName sequence-timout          chord


" TODO: add fakekey capture group for additional commands
" TODO: add @ group for calling alias functions

"-----------------------------------------------------------------------------
" Other Commands
syn keyword kanataPredefinedKeys mlft                   mmid                  mrgt
syn keyword kanataPredefinedKeys mfwd                   mbck                  mltp
syn keyword kanataPredefinedKeys mftp                   mmtp                  mrtp
syn keyword kanataPredefinedKeys mbtp                   mwheel-up             mwheel-down
syn keyword kanataPredefinedKeys mwheel-left            mwheel-right          movemouse-up
syn keyword kanataPredefinedKeys movemouse-down         movemouse-left        movemouse-right
syn keyword kanataPredefinedKeys movemouse-accel-up     movemouse-accel-down  movemouse-accel-left 
syn keyword kanataPredefinedKeys movemouse-accel-right

"-----------------------------------------------------------------------------
"   Comments
syn cluster kanataCommentGroup                              contains=@Spell
syn match   kanataComment        ";.*$"                     contains=@kanataCommentGroup
syn region  kanataCommentRegion  start="#|"     end="|#"    contains=kanataCommentRegion,@kanataCommentGroup
syn region  kanataComment        start="#+nil"  end="\ze)"  contains=@kanataCommentGroup
syn match   kanataComment        '^\s*#+nil.*$'             contains=@kanataCommentGroup

"-----------------------------------------------------------------------------
"   Commands
" Chords and Predefined symbols
" e.g. C-j M-left
syn keyword kanataMisc C-    M-     A-
syn keyword kanataMisc S-    RA-    AG
syn keyword kanataMisc       M-C-   A-C-
syn keyword kanataMisc S-C-  RA-C-
syn keyword kanataMisc C-M-         A-M-
syn keyword kanataMisc S-M   RA-M-
syn keyword kanataMisc C-S-  M-S-   A-S-
syn keyword kanataMisc       RA-S-
syn keyword kanataMisc _     XX
syn match   kanataMisc "^\s*+nil.*$" contains=kanataMisc
" syn match   kanataMisc "\l*\u*\s" contains=kanataMisc

let b:current_syntax = "kanata"


hi def link kanataComment          Comment
hi def link kanataCommentRegion    Comment
hi def link kanataDefinitionBlock  DiffChange
hi def link kanataCommandName      PreProc
hi def link kanataMisc             PreProc
hi def link kanataMiscChordGroup   PreProc
hi def link kanataLanguageKeywords Keyword
hi def link kanataDefinitionBlock  PreProc
hi def link kanataPredefinedKeys   Statement
