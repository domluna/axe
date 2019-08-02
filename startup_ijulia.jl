push!(LOAD_PATH, "$(homedir())/.julia/dev")
try
    @eval using Revise
catch
end
