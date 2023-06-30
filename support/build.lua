-- Build configuration for support (private module)
-- Matthew Leingang, 2023-06-29

bundle = "Gotham"
module = "support"
version = "0.0"
date = "2023-06-29"

maindir = ".."
supportdir = "support"

stdengine = "luatex"
checkopts = "-interaction=batchmode"

typesetfiles = {}

sourcefiles = {"main.bib"}

-- private module, don't install
function dont_install()
    print ("Installation of private module disabled.")
    return 0
end

if target_list then
    target_list.install.func = dont_install
end

dofile(maindir .. "/build-config.lua")

-- LaTeX style versioning
next_version = next_version_latex

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
