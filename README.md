# pemacs
My personal emacs config. Based on prelude - https://github.com/bbatsov/prelude

Install Guide:

git clone https://github.com/molezs/pemacs.git ~/.emacs.d

After install:

Change /modules/prelude-company.el and /modules/cpplint.el directories for your machine

M-x Recompile-Init

create a .gnus.el if you want to use gnus mail reader

If anyone ever uses this you are encouraged to fork your own copy and modify /core/prelude-packages.el and the rest of the config to your own liking. Packages included are modified via /modules/modules.el and their respective files. All packages are enabled by default.
/vendor is for unmodified packages not included in melpa. This is where googleflycheck files are included in this distribution - https://github.com/flycheck/flycheck-google-cpplint
The google style guide and cpplint can be found at - https://github.com/google/styleguide

This is my personal config please let me know if you come across any personal information accidentally included. This will be updated whenever my config changes so do not expect stability. The intention is to follow most of prelude's philosophy, but create a much more personal distribution, pre-tweaked with all packages ready to go. Most prelude key-binds have been disabled and will be added on an as needed basis in order to customize further and learn their uses (crux is installed but not used at the moment). The necessities are an effective and minimal IDE, while keeping boot times low and performance high. I recommend forking your own copy.

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
