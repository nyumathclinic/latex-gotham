# latex-gotham

LaTeX packages for the NYU brand.

## Contents

This bundle contains several modules:

* `beamerthemeNYU22` installs a beamer presentation theme called `NYU22`. 
  It provides a look and feel in the contemporary/subtle quadrant of the tone
  pallette.

* `beamerthemeGotham` installs a beamer presentation theme called `Gotham`. It
  provides a look and feel using the brand edition prior to 2022. Since `NYU22`
  adapts `Gotham`, both are shipped, but the `Gotham` theme should probably not
  be used anymore.

* `xcolor-nyu22` is a package (extending `xcolor`) which provides names for the
  colors in the official 2022 brand pallette.

* `xcolor-nyu` provides color names for the pre-2022 palette. These colors are
  officially deprecated.

* `nyu22fonts` is a LaTeX package which chooses fonts consistent with the brand.

* `logos` provides image files for many NYU school logos.

Read the READMEs in any of the modules for more information.

## Installation

Download or clone the repository.  If you have checked out the repository before
and want to make sure yours is up-to-date, execute `git pull`.

At the root level of the repository, execute:

    l3build install

This should install the packages in the places that your TeX installation can
find it and also that you can write to.  But if you're nervous, run this first:

    l3build install --dry-run

This will prepare the installation in the `build/` subdirectory and inform you
where it *would* install.

You can also run `l3build install` within any of the module subfolders if you
only want to install that module only. But this should be used with caution
since some modules depend on each other.

A full installation will build/install documentation and source files in the
proper place:

    l3build install --full

Again, the `--dry-run` option will prepare without installation.

If your TeX installation doesn't have `l3build` (that is, you can an error
message like `l3build: command not found`), try instead:

    texlua build.lua install --full

But you should probably update your TeX distribution.

If the `--full` option isn't recognized, skip
it and install the documentation separately:

    cp -r build/doc/* `kpsewhich --var-value TEXMFHOME`/doc 

But again, you should probably update your TeX distribution. 

## Documentation

Within the repository, this command will build the documentation:

    l3build doc

Then look in the `build/doc` directory.  The files ending in `-code.pdf` 
include user documentation and pretty-printed code.

After installation, you can execute 

    texdoc <package>

anwhere from the command line to view the user documentation.

    texdoc -l <package>

will list the available documents for that package.

## License

Copyright (C) 2019–2022 by Matthew Leingang <leingang@nyu.edu>.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

