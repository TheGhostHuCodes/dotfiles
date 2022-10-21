if status is-interactive
    if test -e ~/.local_exports
        source ~/.local_exports
    end

    alias vi="nvim"

    # Initialize pyenv when starting a new terminal.
    pyenv init - | source
end
