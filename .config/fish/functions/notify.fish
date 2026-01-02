function notify
  osascript -e "display notification \"$argv[2]\" with title \"$argv[1]\""
end
