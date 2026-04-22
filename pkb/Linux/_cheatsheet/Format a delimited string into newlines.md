```sh
sed 's/,/,\n/g'
```
Command breakdown:
- `s/`  = substitute, use `/` as the delimiter for sed command
- `s#` = same as above, but use `#` as a the delimiter for the rest of the command
- `,/,\n` = substitute commas for a comma followed by a newline
- `/g` = do it globally