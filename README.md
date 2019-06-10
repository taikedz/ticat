# ticat - cat with titles

Command to show file contents, whilst adding titles.

```sh

# Show file1 and file2 contents, each headed by their file name
ticat file1 file2


# Use '//' in front of file names
ticat -t '//' file1 file2


# before and after titles, add 2 and 1 blank lines respectively
ticat -B 2 -A 1 file1 file2


# Use '> ' in front of each line of file (prefix)
ticat -p '> ' file1 file2


# Indent each line with 4 spaces, leave titles un-indented
# Prefix is applied after indentation
ticat -i file1 file2
```

Example use to generate nice listings for posting online:

```sh
ticat -i -t '$ cat ' -B 1 -A 1 file1 file2 file3
```

Looks like

```

$ cat file1

    Contents of file 1

$ cat file2

    Contents of file 2

$ cat file3

    Contents of file 3
```
