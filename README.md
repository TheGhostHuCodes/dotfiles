# dotfiles

These are my dotfiles for the various programs that I use.

## Prerequisites

### dotters

I use [dotter](https://github.com/SuperCuber/dotter) to manage the templating
and deployment of my dotfiles. If this is not available in your package manager,
it can be easily installed if you have a Rust toolchain installed.

```sh
cargo install dotter
```

Once this repo is cloned, add a `local.toml` file containing all of the dotfile
`packages` that should be installed on the local machine. It should look
something like this:

```toml
packages = ["git", "readline"]
```

This is also the file where you locally override any variables in `global.toml`
that need to be overwritten.

You can dry-run your dotfiles deployment to make sure that nothing unexpected
will happen:

```sh
dotter --dry-run
```

Finally, deploy your dotfiles using the command:

```sh
dotter
```
