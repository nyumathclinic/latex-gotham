-- Build configuration for beamerthemeGotham
-- Matthew Leingang, 2019-12-10

bundle = "Gotham"
module = "beamerthemeGotham"

typesetfiles = {"*.tex", "examples/*.tex"}
typesetexe = "xelatex"

-- Root directory of the TDS structure for the module to be installed into.
-- Mentally prepend the path to the correct texmf tree THEN either "tex" (for
-- includes), "doc" (for documentation), or "source" (for source files).
tdsroot = "latex/beamer/themes/theme"

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

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
