{
  programs.git = {
    enable = true;
    ignores = [
      ".envrc"
      ".direnv"
    ];
    settings = {
      user = {
        name = "Will Byrne";
        email = "will.alex.byrne@gmail.com";
      };
      alias = {
          co = "checkout";
      };
    };
  };
}
