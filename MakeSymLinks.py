#!/user/bin/env python
import os
import os.path
import datetime
import shutil
import errno

class dotfile:
    def __init__(self, fullRepoPath, fullDeploymentPath):
        self.fullDeploymentPath = fullDeploymentPath
        self.fullRepoPath = fullRepoPath

    def backup(self, fullPath):
        baseFolder = os.path.basename(os.path.normpath(fullPath))
        currentTime = datetime.datetime.now().strftime('%Y-%m-%d_%H%M%S')
        backupFolder = currentTime + baseFolder
        # Once per second updates of dotfiles is probably ok.
        # TODO: Append a guid if the backupfolder already exists.
        backupPath = os.path.join(os.path.expanduser("~"), backupFolder)
        os.mkdir(backupPath)
        print("cleaning up old files into directory: ", backupPath)
        shutil.move(self.fullDeploymentPath, backupPath)

    def makeLink(self):
        if not os.path.islink(self.fullDeploymentPath):
            self.backup(self.fullDeploymentPath)
        try:
            os.symlink(self.fullRepoPath, self.fullDeploymentPath)
        except OSError as ex:
            if ex.errno == errno.EEXIST:
                os.remove(self.fullDeploymentPath)
                os.symlink(self.fullRepoPath, self.fullDeploymentPath)


homePath = os.path.expanduser("~")
vimrc = dotfile(os.path.join(os.getcwd(), "vim/vimrc"),
        os.path.join(homePath, ".vimrc"))
vimrc.makeLink();
tmuxConf = dotfile(os.path.join(os.getcwd(), "tmux/tmux.conf"),
        os.path.join(homePath, ".tmux.conf"))
tmuxConf.makeLink();
tmux_osx_conf = dotfile(os.path.join(os.getcwd(), "tmux/tmux-osx.conf"),
        os.path.join(homePath, ".tmux-osx.conf"))
tmux_osx_conf.makeLink();
gitconfig = dotfile(os.path.join(os.getcwd(), "git/gitconfig"),
        os.path.join(homePath, ".gitconfig"))
gitconfig.makeLink();
