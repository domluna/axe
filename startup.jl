push!(LOAD_PATH, "$(homedir())/.julia/dev")
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
    end
end

