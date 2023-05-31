-- Build configuration for nyu22report
-- Matthew Leingang, 2023-05-30

bundle = "Gotham"
module = "nyu22report"
version = "0.6"
date = "2023-05-31"

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

-- Root directory of the TDS structure for the module to be installed into.
-- Mentally prepend the path to the correct texmf tree THEN either "tex" (for
-- includes), "doc" (for documentation), or "source" (for source files).
-- tdsroot = "latex"

-- The "luatex" engine produces some very minor differences (like, a single
-- space in a \kern line).  One way around that is to disable the luatex engine:
-- (uncomment to activate)
--
-- checkengines = { "pdftex", "xetex" }
--
-- Another way is to save test logs twice (on command line)
--
--     $ l3build save test
--     $ l3build save -e luatex test
--
-- This creates both "test.tlg" and "test.luatex.tlg" in testfiles.
-- Engine-specific tlg files are only compared with the specific engines.

dofile(maindir .. "/build-config.lua")

-- LaTeX style versioning
next_version = next_version_latex

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
