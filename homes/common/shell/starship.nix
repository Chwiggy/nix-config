{
    programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character.success_symbol = "[➜](bold purple)";
      package.disabled = true;
      hostname = {
        ssh_only = false;
        format = "[$hostname](bold yellow)[$ssh_symbol](bold blue):";
        trim_at = "";
        disabled = false;
      };
      username = {
        show_always = true;
        format = "[$user]($style)@";
      };
      git_branch.style = "bold blue";
      directory.style = "bold blue";
      direnv.disabled = false;
    };
  };
}