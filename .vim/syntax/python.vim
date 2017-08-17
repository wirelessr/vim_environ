syn match   pythonDefStatement  /^\s*\%(def\|class\)/
       \ nextgroup=pythonFunction skipwhite
syn region  pythonFunctionFold  start="^\z(\s*\)\%(def\|class\)\>"
       \ end="\ze\%(\s*\n\)\+\%(\z1\s\)\@!." fold transparent

hi link pythonDefStatement Statement
