---
$if(title)$
title: '$title$'
$endif$
$if(author)$
author: $author$
$endif$
$if(date)$
date: $date$
$endif$
$if(permalink)$
permalink: $permalink$
$endif$
$if(tags)$
tags: 
  - $tags$
$endif$
---

$for(header-includes)$
$header-includes$

$endfor$
$for(include-before)$
$include-before$

$endfor$
$if(toc)$
$toc$

$endif$
$body$
$for(include-after)$

$include-after$
$endfor$
