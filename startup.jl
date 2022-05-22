push!(LOAD_PATH, "$(homedir())/.julia/dev")

try
    using Revise
    using OhMyREPL
    using REPLVim

    @async REPLVim.serve()
    println()
catch e
    @warn "Error initializing" exception=(e, catch_backtrace())
end
