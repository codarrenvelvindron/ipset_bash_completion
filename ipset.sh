# ipset parameter-completion
#Copyright (c)2016 Codarren Velvindron <codarren@hackers.mu>

#Permission to use, copy, modify, and distribute this software for any
#purpose with or without fee is hereby granted, provided that the above
#copyright notice and this permission notice appear in all copies.

#THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

_ipset ()
{
    local cur prev words cword
    _init_completion || return

    local special i
    for (( i=0; i < ${#words[@]}-1; i++ )); do
        if [[ ${words[i]} == @(create|add|del|test|destroy|list|save|restore|flush|rename|swap|help|version) ]]; then
            special=${words[i]}
        fi
    done
    COMPREPLY=( $(compgen -W 'create add del test destroy list save restore flush rename swap help version -' -- "$cur" ) )  
    case "$cur" in
    -*)
    COMPREPLY=( $( compgen -W '-N -A -B -W -X' $cur ) );;
    esac
    return 0
} &&

complete -F _ipset ipset
