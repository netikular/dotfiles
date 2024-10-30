function parse_opts
  argparse 'h/help' 'v/vault=' -- $argv
  or return

  if set -ql _flag_help
    echo "nn [-h | --help] [-v | --vault] [FILENAME]"
    return 0
  end

  set vault "notes"

  if set -ql _flag_vault
    set vault $_flag_vault
  end

  echo (string join "\n" $vault $argv)

end
