function ghi
    argparse "n/notmux" -- $argv

    if not set -q _flag_notmux
        set tmux_switch "--tmux=center,80%,80%"
    end

    # Check if we're in a git repository
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository. Please run this from within a git repository that has GitHub issues." >&2
        return 1
    end

    GH_FORCE_TTY=80 gh issue list --search "sort:created" |
        fzf $tmux_switch --query="#" --no-sort --ansi --preview "CLICOLOR_FORCE=1 GH_FORCE_TTY=80 preview_issue {1}" \
        --bind "enter:become(GH_FORCE_TTY=80 gh issue view --comments {1} | less -R)" \
        --bind "alt-e:become(gh issue edit {1})" \
        --bind "alt-w:become(gh issue develop {1} -c)" \
        --bind "alt-B:become(dev_issue {1})" \
        --bind "alt-W:become(create_timer {1})" \
        --bind "alt-E:become(gh issue comment {1})"
end
