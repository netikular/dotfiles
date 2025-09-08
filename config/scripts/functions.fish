# Use the loop function to test for the window to be open then move on.
function launch
  open -a $argv[1]
  while true
    if not test -z $(aerospace list-apps --format %{app-name} | grep $argv[1])
      break
    end
  end
end
