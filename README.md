# pemacs
My personal emacs config. Based on prelude - https://github.com/bbatsov/prelude

Install Guide:

git clone https://github.com/molezs/pemacs.git ~/.emacs.d

After install:

Change /modules/prelude-company.el and /modules/cpplint.el directories for your machine

M-x Recompile-Init

create a .gnus.el if you want to use gnus mail reader

If anyone ever uses this you are encouraged to fork your own copy and modify /core/prelude-packages.el and the rest of the config to your own liking. Packages included are modified via /modules/modules.el and their respective files.
/vendor is for packages not included in melpa. This is where flycheck-google-cpplint is included in this distribution - https://github.com/flycheck/flycheck-google-cpplint

This is my personal config please let me know if you come across any personal information accidently included.It will be updated whenever my config changes so do not expect stability. The intention is to follow most of prelude's philosopy, but create a much more personal distrubition. The necessties are an effective and minimal IDE, while keeping boot times low and performance high. I recommend forking your own copy.
