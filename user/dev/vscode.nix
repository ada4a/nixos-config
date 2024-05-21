{vscode-extensions, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with vscode-extensions.vscode-marketplace; [vadimcn.vscode-lldb];
  };
}
