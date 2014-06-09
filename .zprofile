export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/usr/local/mysql/lib
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# DYLD_ environment variables issue
for dir in /bin /usr/bin; do
  for cmd in $(find $dir -perm +6000 -type f -exec basename {} \;); do
    eval "$cmd() { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH DYLD_FALLBACK_LIBRARY_PATH; $dir/$cmd \$*) }"
  done
done
