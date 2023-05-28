-- Build configuration for nyu22fonts
-- Matthew Leingang, 22022-08-05

bundle = "Gotham"
module = "beamerthemeNYU22"
version = "0.6"
date = "2023-05-27"

maindir = ".."
supportdir = "support"

-- Many tests will fail on the pdftex engine, because they require fontspec. So
-- we make the luatex engine the default for checking, and force the engine to
-- keep going no matter what
stdengine = "luatex"
checkopts = "-interaction=batchmode"

typesetfiles = {"*.tex", "examples/*.tex"}
typesetsuppfiles = {"*.png", "*.bib"}
typesetdeps = { maindir .. "/xcolor-nyu22" }
typesetexe = "lualatex"


dofile(maindir .. "/build-config.lua")

-- LaTeX style versioning
next_version = next_version_latex

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
