push!(LOAD_PATH, "$(homedir())/.julia/dev")

if isinteractive()
    import Pkg
    let
        pkgs = ["Revise", "OhMyREPL", "JuliaFormatter", "JuliaSyntax", "Debugger"]
        for pkg in pkgs
            if Base.find_package(pkg) === nothing
                Pkg.add(pkg)
            end
        end
    end

    using OhMyREPL
    colorscheme!("GruvboxDark")
    using Debugger

    using Revise


    ENV["JULIA_EDITOR"] = "nvim"
end

