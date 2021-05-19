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

If you don't want to overwrite existing files, leave the `--delete-existing`
option out.
`--delete-existing` unlinks existing links instead of deleting them.
Check for broken links before applying.

