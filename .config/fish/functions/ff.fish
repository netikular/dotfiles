# Defined in /var/folders/n6/sf905x_x4dnfcp_bg1b3rp940000gn/T//fish.uC2hZ0/ff.fish @ line 1
function ff --description 'Like ** but only returns plain files.'
    # This also ignores .git directories.
    find . \( -name .git -type d -prune \) -o -type f | \
        sed -n -e '/^\.\/\.git$/n' -e 's/^\.\///p'
end
