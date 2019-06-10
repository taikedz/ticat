# ticat - cat with titles

Command to show file contents, whilst adding titles. `cat` is all good and nice, but I spend time often re-editing listings to add titles, indents, etc when posting to lists.

I thought this would be helpful with a small thing like that. Written in augmented bash for [Bash Builder](https://gitlab.com/taikedz/bash-builder)

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

Listing the build script for the project looks like this:

```
$ bin/ticat build.sh -i -A 2 -B 1

build.sh


    bbuild src/ticat.sh bin/ticat
```

Example use to generate nice listings for posting online:

```sh
ticat -i -t '$ cat ' -B 1 -A 1 file1 file2 file3
```
