-- Build configuration for nyu22fonts
-- Matthew Leingang, 2022-08-05

bundle = "Gotham"
module = "beamerthemeNYU22"
version = "0.7a"
date = "2023-05-29"

maindir = ".."
supportdir = "support"

stdengine = "luatex"
checkopts = "-interaction=batchmode"
checksuppfiles = {"lipsum.tex"}

typesetfiles = {"*.tex", "examples/*.tex"}
typesetsuppfiles = {"*.png", "*.bib"}
typesetdeps = {
   maindir .. "/xcolor-nyu22",
   maindir .. "/nyu22fonts"
}
typesetexe = "lualatex"
-- Use a bundle-level bib file
function docinit_hook()
   errorlevel = cp("main.bib", maindir .. "/support", typesetdir)
   assert(errorlevel == 0, 
       "Could not copy main.bib to " .. typesetdir)
   return errorlevel
end


dofile(maindir .. "/build-config.lua")

-- LaTeX style versioning
next_version = next_version_latex

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
