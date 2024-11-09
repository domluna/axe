push!(LOAD_PATH, "$(homedir())/.julia/dev")

if isinteractive()
    import Pkg
    import REPL
    import REPL.LineEdit
    import JLFzf

    let
        pkgs = [
            "Revise",
            "Chairmarks",
            "JLFzf",
            # "BasicAutoloads",
            # "JuliaFormatter",
            # "Debugger",
        ]
        for pkg in pkgs
            if Base.find_package(pkg) === nothing
                Pkg.add(pkg)
            end
        end
    end

    # import BasicAutoloads
    # BasicAutoloads.register_autoloads([
    #     ["@b", "@be"] => :(using Chairmarks),
    #     [
    #         "@test",
    #         "@testset",
    #         "@test_broken",
    #         "@test_deprecated",
    #         "@test_logs",
    #         "@test_nowarn",
    #         "@test_skip",
    #         "@test_throws",
    #         "@test_warn",
    #         "@inferred",
    #     ] => :(using Test),
    #     # ["@about"]               => :(using About; macro about(x) Expr(:call, About.about, x) end),
    # ])
    # using Debugger

    using Revise

    ENV["JULIA_EDITOR"] = "nvim"

    const mykeys = Dict{Any,Any}(
        # primary history search: most recent first
        "^R" => function (mistate, o, c)
            line = JLFzf.inter_fzf(
                JLFzf.read_repl_hist(),
                "--read0",
                "--tiebreak=index",
                "--height=80%",
            )
            JLFzf.insert_history_to_repl(mistate, line)
        end,
    )
    function customize_keys(repl)
        repl.interface = REPL.setup_interface(repl; extra_repl_keymap = mykeys)
    end
    atreplinit(customize_keys)
end
