# (V)iM Loving It!
The most fun I've had with a text editor.

- [An excellent primer][1] for understanding the basics of ViM and creating sentences using its grammar
- [VimScript][2]
- [Files and buffers][3]
- [System][4] [clipboard interaction][5]
- [Cheat sheet][6]
- [Advanced cheat sheet][11]
- [VsVim][7]
- [VimAwesome][8]
- [VimPlug][9]
- [NerdTree][10]
- [VimColors][12]
- [Wiki][13]
- [Custom formatting][14]
- [Using][15] [CTags][18]
- [Regex/Pattern Reference][16]
- [Searching within files][17]
- [Fuzzy Search][19]: ctrlp and ag
- [Vimdiff][20] within editor
- [The Silver Searcher][21] integration
- [Commentary][22] provides a comment operator
- [Native Fuzzy Search][23]
- [Airline Font][24] [problems][25]
- [The Power of G][26]
- [Buffers][27] and [tabs][28] (schools of thought)
- [Four space tab][30]
- [Smart case][31]
- [Source/header switch][32]
- [Vim-LaTeX][33]
- [Tabular][34] and [markdown][35] extensions.
- [Markdown style guide][36]

## Misc Pointers

C-x and C-a can subtract/add numbers

### Autocompletion
<C-n> Generic keywords
<C-x><C-n> Current buffer keywords
<C-x><C-i> Included file keywords
<C-x><C-]> Tags file keywords
<C-x><C-k> Dictionary lookup
<C-x><C-l> Whole line completion
<C-x><C-f> Filename completion
<C-x><C-o> Omni-completion

### Multiple sessions:
:mksession ~/mysession.vim
:source ~/mysession.vim OR
$ vim -S ~/mysession.vim (at startup)

In your machine specific .xvimrc (where `x <- {l, w, m}`) files, set specific
options like textwidth, path, tags, ctrlp working directory, etc.

### Current Window state
You can save the state of the current window through the mkview and loadview
commands. This includes window specific variables, **folds** and the like. Very
handy for pesky files which you would like to fold away. see :h mkview, :h
loadview. This can be [automated][29] with auto commands. Also have a look at
:h auto-setting and :h modeline

Move the line at cursor position to:

         | (1) | (2)
---------|-----|-----
Top      | zt  | z<CR>
Middle   | zz  | z.
Bottom   | zb  | z-

(1): Cursor column unchanged
(2): Cursor brought to first non whitespace character

### Autosetup

Read the [faq and tips][30] setion of vim-plug documentation to setup automatic
plugin install for new vim installs.

--------------------------------------------------------------------------------

[1]: https://danielmiessler.com/study/vim/#gs.CNpdkew
[2]: http://learnvimscriptthehardway.stevelosh.com/
[3]: http://stackoverflow.com/questions/53664/how-to-effectively-work-with-multiple-files-in-vim
[4]: http://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard
[5]: http://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
[6]: https://vim.rtorr.com/
[7]: https://github.com/jaredpar/VsVim/wiki/faq
[8]: http://vimawesome.com
[9]: https://github.com/scrooloose/nerdtree
[10]: https://github.com/scrooloose/nerdtree
[11]: http://vimsheet.com/advanced.html
[12]: http://vimcolors.com/
[13]: http://vim.wikia.com/wiki/Vim_Tips_Wiki
[14]: http://stackoverflow.com/questions/35018000/how-to-change-vim-php-auto-formatting-options
[15]: http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
[16]: http://vimregex.com/
[17]: http://vim.wikia.com/wiki/Find_in_files_within_Vim
[18]: http://vim.wikia.com/wiki/Browsing_programs_with_tags
[19]: http://stackoverflow.com/questions/2372307/opening-files-in-vim-using-fuzzy-search
[20]: http://stackoverflow.com/questions/9529934/how-to-use-vimdiff-in-vim-command-mode
[21]: https://robots.thoughtbot.com/faster-grepping-in-vim
[22]: https://github.com/tpope/vim-commentary
[23]: https://gist.github.com/csswizardry/9a33342dace4786a9fee35c73fa5deeb
[24]: http://vi.stackexchange.com/questions/3359/how-to-fix-status-bar-symbols-in-airline-plugin
[25]: https://github.com/vim-airline/vim-airline/wiki/FAQ
[26]: http://vim.wikia.com/wiki/Power_of_g
[27]: http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
[28]: http://stackoverflow.com/questions/26708822/why-do-vim-experts-prefer-buffers-over-tabs
[29]: https://vi.stackexchange.com/questions/5488/can-i-save-folds
[30]: http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
[31]: http://stackoverflow.com/questions/2287440/how-to-do-case-insensitive-search-in-vim
[32]: http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
[33]: http://vim-latex.sourceforge.net/index.php?subject=features&title=Features
[34]: https://github.com/godlygeek/tabular
[35]: https://github.com/plasticboy/vim-markdown
[36]: http://www.cirosantilli.com/markdown-style-guide/
