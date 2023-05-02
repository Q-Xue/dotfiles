
case "$(uname)" in
  Darwin*)
    # MacPorts Installer addition on 2021-08-12_at_21:54:10: adding an appropriate PATH variable for use with MacPorts.
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    export HOMEBREW_API_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/api #brew.idayer.com
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles #brew.idayer.com

    # Setting PATH for Python 3.9
    # The original version is saved in .zprofile.pysave
    PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
    export PATH
    ;;
  Linux*)
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/github_id_rsa
    ;;
esac
