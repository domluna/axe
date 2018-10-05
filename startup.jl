atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch err
    end
end

function _ohmyrepl()
    try
        @eval begin
            using OhMyREPL
            OhMyREPL.enable_pass!("RainbowBrackets", false)
            OhMyREPL.enable_pass!("SyntaxHighlighter", false);
        end
    catch err
        @warn "Could not load OhMyREPL.", err
    end
end

#= _ohmyrepl() =#
