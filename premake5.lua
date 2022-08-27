-- premake5.lua
require "export-compile-commands"
workspace "opengl"
    configurations { "Debug", "Release" }
    platforms {"x32", "x64"}


project "opengl"
    kind "ConsoleApp"
    location "build"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"
    ignoredefaultlibraries { "MSVCRT" }

    -- LINKING --
    -- why libdirs is commented - https://premake.github.io/docs/libdirs
--    libdirs {"$libs"}
    links {"libs/glfw3.lib", "libs/glfw3_mt.lib", "libs/glfw3dll.lib"}

--    This include dirs includes the .h without having the need to write directories 
--    in your include in the code this breaks the other lib dependencies. Do not use
--    includedirs{"include/**"}
    includedirs{"include"}

    files { "src/**.h", "src/**.hpp", "src/**.c", "src/**.cpp" }
    files { "include/**.h", "include/**.hpp", "include/**.c", "include/**.cpp" }
    removefiles "**/dummy.cpp"

    -- FILTERS --
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter { "platforms:Win32" }
        system "windows"
        architecture "x86"

    filter { "platforms:x64" }
        system "windows"
        architecture "x86_64"

    -- deactivate the filters above so what we write below does not apply to the last filter only
    filter {}
