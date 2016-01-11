# Remove blank lines
# /^$/d
# /^ *$/d

# Fix problematic characters
s/ /\\ /g
s/'/\\'/g
s/(/\\(/g
s/)/\\)/g
s/&/\\&/g
s/;/\\;/g

# Action to do
#s/^/cd /g
s/^/rm /g
#s/^/mv /g
#s/$/ Unix/g
