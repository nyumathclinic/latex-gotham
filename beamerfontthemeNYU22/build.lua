-- Build configuration for beamerfontthemeNYU22
-- Matthew Leingang, 2025-02-07

bundle = "Gotham"
module = "beamerfontthemeNYU22"
version = "0.0"
date = "2025-02-07"

maindir = ".."
supportdir = "support"

stdengine = "luatex"
checkopts = "-interaction=batchmode"
checksuppfiles = {"lipsum.tex"}

typesetfiles = {"*.tex", "examples/*.tex"}
typesetsuppfiles = {"*.png", "*.bib"}
typesetdeps = {
   maindir .. "/xcolor-nyu22",
   maindir .. "/nyu22fonts",
--   maindir .. "/support"
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
