# pemacs
This is rarely updated or maintained.

My personal emacs config. A tailored C/C++ IDE.  Based on prelude - https://github.com/bbatsov/prelude

Install Guide:

git clone https://github.com/molezs/pemacs.git ~/.emacs.d

If doom-modeline is missing symbols
M-x all-the-icons-install-fonts

After install:

Change /modules/prelude-company.el (c-headers) and /modules/cpplint.el (google cpplint) directories for your machine

Set a font for your machine in /core/prelude-ui.el Currently using Ubuntu Mono

M-x Recompile-Init

create a .gnus.el if you want to use gnus mail reader
I also use gnus as a rss reader. You can add news.gmane.io if you want to use nntp server instead.

If anyone ever uses this you are encouraged to fork your own copy and modify /core/prelude-packages.el and the rest of the config to your own liking. Packages included are modified via /modules/modules.el and their respective files. All packages are enabled by default, none are required.
/vendor is for unmodified packages not included in melpa. This is where google's cpplint flycheck files are included in this distribution - https://github.com/flycheck/flycheck-google-cpplint

The google cpplint can be found at - https://github.com/cpplint/cpplint

Use a LSP server of your choice. Like clangd or ccls - https://github.com/MaskRay/ccls

This is my personal config please let me know if you come across any personal information accidentally included. This will be updated whenever my config changes so do not expect stability. The intention is to follow most of prelude's philosophy, but create a much more personal distribution. Due to the nature of emacs some packages might require further tweaking in order to get full IDE capabilities. This distribution is only tested on Linux. I recommended anyone using emacs to switch to Linux  however, it should be cross platform (to an extent). Most prelude key-binds have been disabled and will be added on an as needed basis in order to customize further and learn their uses (crux is installed but not used at the moment). The necessities are an effective and "minimal" IDE, while keeping boot times low and performance high. I recommend forking your own copy.

## License

Excluding the vendor directory, all files are considered modified.

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see http://www.gnu.org/licenses/.

See
[COPYING](https://github.com/molezs/pemacs/blob/main/LICENSE)
for details.
