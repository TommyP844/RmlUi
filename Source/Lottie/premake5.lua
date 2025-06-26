project "rlottie"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/%{cfg.buildcfg}")
    objdir ("obj/%{cfg.buildcfg}")

    -- Core RmlUi files
    files {
        "../**.cpp",
        "../../Include/**.h",
        "../../Include/**.hpp",
    }

    includedirs {
        "../../Include",
        _G.FREETYPE_INCLUDEDIR or "external/freetype/include",
    }

    links {
        "freetype",
    }

    files {
        "Source/Plugins/Lottie/ElementLottie.cpp",
        "Source/Plugins/Lottie/LottiePlugin.cpp",
        "Source/Plugins/Lottie/LottiePlugin.h",
        "Include/RmlUi/Lottie/ElementLottie.h",
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