# vim-bracexpand \[wip\]

Bash's brace expansion in vim. Very early stage, you probably shouldn't use this yet.

## Bash Example
```
 $ echo a{b,c}d
abd acd
```

## Vim Example

```
i += array[{0,1,2, 13}] * 3;

i += array[0] * 3;
i += array[1] * 3;
i += array[2] * 3;
i += array[ 13] * 3;
```

The function searches the current line for the first pair of curly braces which contains at least one comma
Unlike Bash, the region can contain spaces, so `{, a}` would work.

Also unlike bash, the whole line is duplicated for each expansion.

The script does not handle nested brace expansions, yet.
Bash's iterated expansion will come next:
```
$ echo {1..5}
1 2 3 4 5
$echo {0..10..2}
0 2 4 6 8 10
```

Mapped to `<leader>e` by default, but `<Plug>BraceExpand` is provided to create your own map.
