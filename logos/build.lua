-- Build configuration for logos
-- Matthew Leingang, 2020-09-23

bundle = "Gotham"
module = "logos"

maindir = ".."

-- Files to install to the tex area of the texmf tree
imagefiles = {"*.eps", "*.svg", "*_*_*.pdf", "*.png", "*.jpg"}
sourcefiles = imagefiles
installfiles = imagefiles

-- Files to typeset for documentation
typesetfiles = {"logos.tex"}

-- Executable for compiling doc(s)
typesetexe = "xelatex"
cleanfiles = {"*.log", "logos.pdf", "*.zip"}

-- Root directory of the TDS structure for the module to be installed into.
-- Mentally prepend the path to the correct texmf tree THEN either "tex" (for
-- includes), "doc" (for documentation), or "source" (for source files).
tdsroot = "generic"


function update_tag(file,content,tagname,tagdate)
    -- This should go in a pre-tag hook, but there isn't one.
    -- ensure that the tagname matches `v`x.y.z
    assert(string.match(tagname,"^v%d+%.%d+%.%d+$"),
        "invalid tag name. Use a literal 'v', then a semantic version number of the form x.y.z.")
    -- Make sure the working directory is "clean".
    -- See https://unix.stackexchange.com/a/394674/62853
    assert(os.execute("git diff-index --quiet HEAD .") == 0,
        "Working directory dirty.  Commit changes and try again.")
    -- TeX dates are in yyyy/mm/dd format.  tagdate is in yyyy-mm-dd format.
    tagdate_tex = string.gsub(tagdate,'-','/')
    if string.match(file, "%.dtx$") then
        content = string.gsub(content,
            "\n  %[%d%d%d%d/%d%d/%d%d v.- ",
            "\n  [" .. tagdate_tex .. " " .. tagname .. " "
    )
        content = string.gsub(content,
            "\n%% \\changes{unreleased}",
            "\n%% \\changes{" .. tagname .. "}"
        )
        return content
    end
end


kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
