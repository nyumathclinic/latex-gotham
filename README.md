# latex-gotham

LaTeX packages for the NYU visual identity.

## Contents

So far there are three latex “modules” in this bundle:

* `beamerthemeGotham` installs a beamer presentation theme called `Gotham`.  

* `xcolor-nyu` provides names for the colors prescribed by the NYU website.

* `logos` provides images files for many NYU school logos.

## Installation

Download or clone the repository.  Within the repository's directory, execute:

    $ l3build install

This should install the packages in the places that your TeX installation can
find it and also that you can write to.  But if you're nervous, run this first:

    $ l3build install --dry-run

This will prepare the installation in the `build/` subdirectory and inform you
where it *would* install.

A full installation will build/install documentation and source files in the
proper place:

    $ l3build install --full

Again, the `--dry-run` option will prepare without installation.

If your TeX installation doesn't have `l3build` (that is, you can an error
message like `l3build: command not found`), try instead:

    $ texlua build.lua install --full

But you should probably update your TeX distribution.

If the `--full` option isn't recognized, skip
it and install the documentation separately:

    $ cp -r build/doc/* `kpsewhich --var-value TEXMFHOME`/doc 

But again, you should probably update your TeX distribution. 

## Documentation

Within the repository, this command will build the documentation:

    $ l3build doc

Then look in the `build/doc` directory.  The files ending in `-code.pdf` 
include user documentation and pretty-printed code.

After installation, you can execute 

    $ texdoc <package>

anwhere from the command line to view the user documentation.

    $ texdoc -l <package>

will list the available documents for that package.

## License

Copyright (C) 2019 by Matthew Leingang <leingang@nyu.edu>.

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

