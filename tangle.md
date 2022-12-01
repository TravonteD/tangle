# Tangle 

## Description
Extracts markdown code blocks into a file

## Usage
```
tangle input_file output_file ?language?
```

### Example
```
tangle tangle.md tangle sh
```

## Code (yes, this is actually what I use to write it)
- The shebang points to `/bin/sh` since this script is posix compliant
```sh
#!/bin/sh

```

- Setting up some human readable names for arguments and a default pattern for extraction
```sh
input_file="$1"
output_file="$2"
language="$3"
default_pattern='^```'

```

- Checks if a language specifier was given, if so we'll only output those blocks
> the `\`` is escaped when between the double-quotes to prevent evaluation
```sh
if [ -n "$language" ];
then
  pattern="^\`\`\`$language"
else
  pattern="$default_pattern"
fi
```

- This is a block that won't be emitted (used to test specific emission)
```
echo "I shouldn't be here"
```

- Uses `sed` to print out the lines between the pattern,
since this also prints the matching lines we delete them in a second pass
```sh
sed -n "/$pattern/,/$default_pattern/p" "$input_file" | sed "/$default_pattern/d" > "$output_file"
```

