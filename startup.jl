push!(LOAD_PATH, "$(homedir())/.julia/dev")

if isinteractive()
    import Pkg
    let
        pkgs = ["Revise", "OhMyREPL", "JuliaFormatter", "JuliaSyntax", "Debugger", "Chairmarks"]
        for pkg in pkgs
            if Base.find_package(pkg) === nothing
                Pkg.add(pkg)
            end
        end
    end

    # import BasicAutoloads
    # BasicAutoloads.register_autoloads([
    #     ["@b", "@be"]            => :(using Chairmarks),
    #     ["@test", "@testset", "@test_broken", "@test_deprecated", "@test_logs",
    #     "@test_nowarn", "@test_skip", "@test_throws", "@test_warn", "@inferred"] =>
    #                                 :(using Test),
    #     ["@about"]               => :(using About; macro about(x) Expr(:call, About.about, x) end),
    # ])

    # using OhMyREPL
    # colorscheme!("GruvboxDark")
    # using Debugger

    using Revise


    ENV["JULIA_EDITOR"] = "nvim"
end

