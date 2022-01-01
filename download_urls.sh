# check argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <url_metadata>"
    exit 1
fi
# wget all files from URLs in metadata
# follow directory structure of URL by mkdir
for url in $(cat $1); do
    # get directory structure from url and strip domain
    filepath=$(echo $url | sed -e 's/https:\/\/[^\/]*\///' | xargs dirname)
    echo "Downloading $url to $filepath"
    # create directory structure
    # mkdir -p $(dirname $filepath)
    # download file
    # wget -O --no-verbose --show-progress $filepath $url
done
