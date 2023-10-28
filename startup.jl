push!(LOAD_PATH, "$(homedir())/.julia/dev")

if isinteractive()
    import Pkg
    let
        pkgs = ["Revise", "OhMyREPL", "JuliaFormatter", "JuliaSyntax"]
        for pkg in pkgs
            if Base.find_package(pkg) === nothing
                Pkg.add(pkg)
            end
        end
    end

    using Revise
    using OhMyREPL
end
