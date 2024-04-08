{
  pkgs, ...
}: {
    programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "sha256-Z6EYQdasvpl1P78poj9efnnLj7QQg13Me8x1Ryyw+dM=";
        };
      }
    ];

    
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases.ll = "ls -l";
    historySubstringSearch.enable = true;
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "branch"
        "colored-man-pages"
        "git"
        "github"
        "gitignore"
        "history"
        "history-substring-search"
        "isodate"
        "jsontools"
        "man"
        "pip"
        "pipenv"
        "python"
        "systemd"
        "themes"
        "urltools"
        "zsh-interactive-cd"
        "rsync"
      ];
      theme = "jtriley";
    };
  };
}