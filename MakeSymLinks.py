#!/user/bin/env python
import os
import os.path
import datetime
import shutil

homePath = os.path.expanduser("~")
# Repo File Structure.
dotVimrcFilePath = os.path.join(os.getcwd(), "vim/vimrc")
# Target .vimrc path.
targetVimrcPath = os.path.join(homePath, ".vimrc")

sourceTmuxConfPath = os.path.join(os.getcwd(), "tmux/tmux.conf")
# Target .tmux.conf path.
targetTmuxConfPath = os.path.join(homePath, ".tmux.conf")

print(".vimrc source path: ", dotVimrcFilePath)
print(".vimrc target path: ", targetVimrcPath)
print(".tmux.conf source path: ", sourceTmuxConfPath)
print(".tmux.conf target path: ", targetTmuxConfPath)
if os.path.isfile(targetVimrcPath) or os.path.islink(targetVimrcPath)\
        or os.path.isfile(targetTmuxConfPath)\
        or os.path.islink(targetTmuxConfPath):
    # Once a second updates of dotfiles is probably ok.
    # TODO: Append a guid if the backupfolder already exists.
    currentTime = datetime.datetime.now().strftime('%Y-%m-%d_%H%M%S')
    backupDir = currentTime + "_dotfilesBackup"
    backupPath = os.path.join(homePath, backupDir)
    os.mkdir(backupPath)
    print("cleaning up old files into directory: ", backupPath)
    shutil.move(targetVimrcPath, backupPath)
    shutil.move(targetTmuxConfPath, backupPath)
    
os.symlink(dotVimrcFilePath, targetVimrcPath)
os.symlink(sourceTmuxConfPath, targetTmuxConfPath)
