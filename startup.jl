push!(LOAD_PATH, "$(homedir())/.julia/dev")
import Pkg

let
    pkgs = ["Revise", "OhMyREPL", "REPLVim", "Term", "IJulia", "JuliaFormatter"]
    for pkg in pkgs
        if Base.find_package(pkg) === nothing
            if pkg === "REPLVim"
                Pkg.add(url="https://github.com/andreypopp/julia-repl-vim")
            else
                Pkg.add(pkg)
            end
        end
    end
end

using Revise
using OhMyREPL
# using Term
using REPLVim

@async REPLVim.serve()
