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
$endif$
$for(tags)$
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

<div dir="ltr" style="text-align: left;" trbidi="on">
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ TeX: { equationNumbers: {autoNumber: "AMS"} } });
</script>
<script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML' type='text/javascript'>
</script>
<i>MathJax can be iffy.  Try reloading if the equations don't show up.</i><br /><br />

