# fairseq_files_cache

Tired of manually downloading gigabytes of checkpoints from `fairseq`, but have plenty of disk space to save them locally?

This is a code snippet for creating local cache of checkpoints provided within fairseq. Features include:

- Recursively grep URLs starting with `https://dl.fbaipublicfiles.com` in specific directory
- Preserve directory structure of URL by creating corresponding directory before downloading

## Instruction

First, `git clone` the fairseq and `cd` into directory that you're interested in. For example,
```bash
git clone https://github.com/pytorch/fairseq
cd fairseq
cd examples/textless_nlp
```

Then, run the following `grep` command to save the list of file URLs to a text file.

```bash
grep -EoRh "https://dl.fbaipublicfiles.com[a-zA-Z0-9./?=_%:-]*" | sort -u > ~/textless_nlp_files.txt
```
Output should look like the `textless_nlp_files.txt` file in this repository.

Command description:
- `grep -E`: use regex to find file URLs
- `grep -o`: only output what has been found
- `grep -R`: recursive search
- `grep -h`: suppress the prefixing of file names on output
- `sort -u`: sort & remove any duplicates

Finally, copy the `download_urls.sh` to desired directory and run as:

```bash
./download_urls.sh textless_nlp_files.txt
```

## Some TODOs

- Checking file validity to make sure each file is completely downloaded
- Check that all file URLs in fairseq start with `https://dl.fbaipublicfiles.com`
