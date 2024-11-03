function replace-name --description "replace-name <find> <replace> [PATH] [OPTIONS]"
  
  echo $argv[1..2] | read -l find replace
  
  argparse \
    'f/force' \
    'r/recurse' \
    -- $argv
  or set arg_err
 
  # at this point find and replace are still in $argv
  #echo $argv
  
  echo $argv[-1] | read -l path
  if test -n "$path"
    cd -- $path     # if path given go there
  end
  
  #set -q _flag_recurse
  #and set files (fd)
  #or set files (fd -d 1)  # only top level files
  
  set files (fd)

  for f in $files
    set -l new (string replace --all "$find" "$replace" "$f")
    mv $f $new
  end

end

