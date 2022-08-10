-- Build configuration for nyu22fonts
-- Matthew Leingang, 22022-08-05

bundle = "Gotham"
bundleversion = "0.10.1"
bundledate    = "2022-08-10"
module = "nyu22fonts"

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

-- capture the output from a shell command
-- Thanks Norman Ramsey https://stackoverflow.com/a/326715/297797
-- there is also the shell() function from l3build-upload.lua
-- it doesn't trim leading/training whitespace.
function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
  end

tagfiles = {"*.dtx","build.lua","README.md"}

--decorator to only run if repo is clean
function only_if_clean(f)
    return function(x)
        if os.capture("git status --porcelain") ~= "" then
            print("Error: Repository is dirty.  Aborted.")
            os.exit(1)
        else
            print("Repository is clean")
            return f(x)
        end
    end 
end

-- tag = only_if_clean(tag)
target_list.tag.pre = only_if_clean(target_list.tag.pre)


local mydate = os.date("!%Y-%m-%d")
function update_tag(file,content,tagname,tagdate)
    if not tagname and tagdate == mydate then
        tagname = bundleversion
        tagdate = bundledate
    else
        local v_maj, v_min = string.match(tagname, "^v?(%d+)(%S*)$")
        if v_maj == "" or not v_min then
          print("Error: Invalid tag '"..tagname.."'. Tagging aborted")
          os.exit(0)
        else
          tagname = string.format("%i%s", v_maj, v_min)
          tagdate = mydate
        end
    end
    if string.match(file, "%.dtx") then
        local tagdate = string.gsub(tagdate, "-", "/")
        -- replace both LaTeX2e and expl3 date/version specifiers
        content = string.gsub(content,
                              "%[%d%d%d%d%/%d%d%/%d%d%s+v%S+",
                              "["..tagdate.." v"..tagname)
        content = string.gsub(content,
                              "{%d%d%d%d%/%d%d%/%d%d}{v%S+}",
                              "{"..tagdate.."}{v"..tagname.."}")
        content = string.gsub(content,
                              "\n%% \\changes{unreleased}",
                              "\n%% \\changes{" .. tagname .. "}")
    if string.match(file, "%.md") then
        local tagdate = string.gsub(tagdate, "/", "-")
        content = string.gsub(content,
                              "Version: (%d+)(%S+)",
                              "Version: "..tagname)
        content = string.gsub(content,
                              "Date: %d%d%d%d%-%d%d%-%d%d",
                              "Date: "..tagdate)
    end
    if string.match(file , "%.lua$") then
        local tagdate = string.gsub(tagdate, "/", "-")
        content = string.gsub (content,
                               '\nbundleversion%s*= "(%d+)(%S+)"',
                               '\nbundleversion = "' .. tagname .. '"')
        content = string.gsub (content,
                               '\nbundledate%s*= "%d%d%d%d%-%d%d%-%d%d"',
                               '\nbundledate    = "' .. tagdate .. '"')
    end
    return content
end


function tag_hook(tagname,tagdate)
    local v_maj, v_min = string.match(tagname, "^v?(%d+)(%S*)$")
    if v_maj == "" or not v_min then
      print("Error: Invalid tag '".. tagname .."'. Git tagging aborted")
      os.exit(0)
    else
      version = string.format("%i%s", v_maj, v_min)
    end
    msg = "Tagging version " .. version
    cmd = 'git commit -a -m "' .. msg .. '"'
    print ("Running '" .. cmd .. "'")
    shell(cmd)
    cmd = 'git tag -a -m "' .. msg ..  '" ' .. tagname
    print ("Running '" .. cmd .. "'")
    shell(cmd)
end


kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
