push!(LOAD_PATH, "$(homedir())/.julia/dev")

try
    using Revise
    using OhMyREPL
catch e
    @warn "Error initializing" exception=(e, catch_backtrace())
end
