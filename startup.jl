push!(LOAD_PATH, "$(homedir())/.julia/dev")
import Pkg

let
    # pkgs = ["Revise", "OhMyREPL", "REPLVim", "Term", "IJulia"]
    pkgs = ["Revise", "REPLVim", "Term", "IJulia"]
    for pkg in pkgs
        if Base.find_package(pkg) === nothing
            Pkg.add(pkg)
        end
    end
end

using Revise
# using OhMyREPL
using Term
using REPLVim

@async REPLVim.serve()
