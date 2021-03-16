# dotfiles

My personal configuration files repository.

## Usage

Apply by copying files:

```sh
apply.py --delete-existing
```

Apply by creating symbolic links:

```sh
apply.py --link --delete-existing
```

If you dont want to override existing files, leave the `--delete-existing`
option out.
`--delete-existing` unlinks existing links instead of deleting them.
