" Vim syntax file
" Language: notes
" Maintainer: me!

if exists("b:current_syntax")
  finish
  endif

  syn match keywordObject "=="
  syn match keywordObject "\["
  syn match keywordAs "]=="
  syn match keywordActor "=="

  syn match keywordIfTrue "::"
  syn match keywordIfFalse "*"

  syn match comment "#"

  let b:current_syntax = "notes"

  hi def link keywordObject Keyword
  hi def link keywordAs Keyword
  hi def link keywordActor Keyword

  hi def link keywordIfTrue Keyword
  hi def link keywordIfFalse Keyword

  hi def link comment Keyword

