if status is-interactive
    if test -e ~/.local_exports
        source ~/.local_exports
    end

    alias vi="nvim"

    # https://angristan.xyz/how-to-use-nvm-rbenv-pyenv-goenv-with-fish-shell/
    #source (pyenv init - | psub)
end
