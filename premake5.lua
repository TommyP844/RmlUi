project "RmlUi"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"
    architecture "x64"

    defines
    {
        "RMLUI_STATIC_LIB",
        "RMLUI_NO_LUA"
    }

    files {
        "Source/**.cpp",
        "Include/**.h",
        "Include/**.hpp",
    }

    includedirs {
        "Include",
        -- Use global variable, fallback if not set
        _G.FREETYPE_INCLUDEDIR,
        includes
    }

    removefiles {
        "Source/Lua/**.cpp",
        "Source/Lua/**.h",
        "Source/SVG/**.cpp",
        "Source/SVG/**.h"
    }

    links {
        "freetype",
        "rlottie"
    }

    filter "system:windows"
        systemversion "latest"
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "configurations:Debug"
        defines { "DEBUG", "RMLUI_DEBUG" }
        symbols "On"
        runtime "Debug"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
        runtime "Release"