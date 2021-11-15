push!(LOAD_PATH, "$(homedir())/.julia/dev")
push!(LOAD_PATH, "$(homedir())/dev/ml-projects")

try
    using Revise
    using OhMyREPL
    #= using FuzzyCompletions =#

catch e
    @warn "Error initializing" exception=(e, catch_backtrace())
end

#= using REPL =#
#= using REPL.LineEdit =#
#=  =#
#= struct FuzzyCompletionProvider <: REPL.CompletionProvider =#
#=     mod::Module =#
#= end =#
#=  =#
#= function LineEdit.complete_line(c::FuzzyCompletionProvider, s) =#
#=     partial = REPL.beforecursor(s.input_buffer) =#
#=     full = LineEdit.input_string(s) =#
#=  =#
#=     # module-aware repl backend completions =#
#=     comps, range, should_complete = completions(full, lastindex(partial), c.mod) =#
#=     filter!(c->score(c)≥0, comps) =#
#=     return unique!(FuzzyCompletions.completion_text.(comps)), partial[range], should_complete =#
#= end =#

    #= Base.active_repl.interface.modes[1].complete = FuzzyCompletionProvider(Main) # or whatever module where you want to get completes from =#
