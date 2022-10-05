-- Build configuration for the Gotham bundle
-- Matthew Leingang, 2019-12-12

bundle = "Gotham"
bundleversion = "2022-09-17"
bundledate = "2022-09-17"

maindir = "."
modules = {
   "beamerthemeNYU22",
   "beamerthemeGotham",
   "xcolor-nyu22",
   "nyu22fonts",
   "logos"
}


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


kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
