push!(LOAD_PATH, "$(homedir())/.julia/dev")

if isinteractive()
    import Pkg
    let
        pkgs = [
            "Revise",
            "JuliaFormatter",
            "Debugger",
            "Chairmarks",
            "BasicAutoloads",
            "OhMyREPL",
            "LanguageServer",
        ]
        for pkg in pkgs
            if Base.find_package(pkg) === nothing
                if pkg == "OhMyREPL"
                    Pkg.add(pkg, version = "0.5.24")
                    Pkg.pin(pkg, version = "0.5.24")
                else
                    Pkg.add(pkg)
                end
            end
        end
    end

    import BasicAutoloads
    BasicAutoloads.register_autoloads([
        ["@b", "@be"] => :(using Chairmarks),
        [
            "@test",
            "@testset",
            "@test_broken",
            "@test_deprecated",
            "@test_logs",
            "@test_nowarn",
            "@test_skip",
            "@test_throws",
            "@test_warn",
            "@inferred",
        ] => :(using Test),
        # ["@about"]               => :(using About; macro about(x) Expr(:call, About.about, x) end),
    ])

    using OhMyREPL
    # using Debugger
    using Revise


    ENV["JULIA_EDITOR"] = "nvim"
end
