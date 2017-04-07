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

## Misc Pointers

C-x and C-a can subtract/add numbers

### Multiple sessions:
:mksession ~/mysession.vim
:source ~/mysession.vim OR
$ vim -S ~/mysession.vim (at startup)

In your machine specific .xvimrc (where x <- {l, w, m}) files, set specific options like textwidth, path, tags, ctrlp
working directory, etc.

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
