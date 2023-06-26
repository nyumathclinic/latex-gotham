-- Build configuration for xcolor-nyu
-- Matthew Leingang, 2019-12-10

bundle = "Gotham"
module = "xcolor-nyu22"
version = "1.0a"
date = "2023-06-19"

maindir = ".."
typesetfiles = {"*.tex", "examples/*.tex"}
typesetsuppfiles = {"*.png", "*.bib"}
typesetdeps = { maindir .. "/nyu22fonts"}
supportdir = "support"
typesetexe = "lualatex"

stdengine = "luatex"
checkdeps = {maindir .. "/nyu22fonts"}

dofile(maindir .. "/build-config.lua")

-- LaTeX style versioning
next_version = next_version_latex


kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
