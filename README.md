This vim environment is just for python and made by my usage habit. If you have any good recommendation, please feel free to let me know.

# How to generate pytags
find . -name "*.py" -print | xargs ptags.py

# Avoid vi to use this vimrc (because there are lots of warnings)
alias vi='vi -u NONE'

# Common Features

## Find files
ctrl + p : by default, use regexp (I hate fuzzy search very much), and list only files

## Book marks
mm : mark a location

ma : list all marks integrated with ctrlp

## Find tags
lt : list all tags by ctrlp plugin

## Text matching
F3 : use rgrep, and there is a plugin let quickfix be the same as ctrlp

## Highlight multiple words

```
<leader>m : use a free color group to highlight the current cursor
  
[number]<leader>m : use the specific group
  
<leader>* : jump to the next position of current group
```
