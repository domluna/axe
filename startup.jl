push!(LOAD_PATH, "$(homedir())/.julia/dev")
push!(LOAD_PATH, "$(homedir())/ocean/optimization/Wideload")
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
    end
end

