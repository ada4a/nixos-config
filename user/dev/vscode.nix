{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [vadimcn.vscode-lldb.adapter];
  };
}
