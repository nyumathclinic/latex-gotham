-- Build configuration for logos
-- Matthew Leingang, 2020-09-23

bundle = "Gotham"
module = "logos"
version = "0.4"
date = "2023-06-08"

maindir = ".."

-- Files to install to the tex area of the texmf tree
imagefiles = {"*.eps", "*.svg", "*_*_*.pdf", "*.png", "*.jpg"}
sourcefiles = imagefiles
installfiles = imagefiles

-- Files to typeset for documentation
typesetfiles = {"nyu-logos.tex"}

-- Executable for compiling doc(s)
typesetexe = "xelatex"
cleanfiles = {"*.log", "nyu-logos.pdf", "*.zip"}

-- Root directory of the TDS structure for the module to be installed into.
-- Mentally prepend the path to the correct texmf tree THEN either "tex" (for
-- includes), "doc" (for documentation), or "source" (for source files).
tdsroot = "generic"

dofile(maindir .. "/build-config.lua")
-- LaTeX style versioning
next_version = next_version_latex

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
