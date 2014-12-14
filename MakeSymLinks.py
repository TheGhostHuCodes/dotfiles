#!/user/bin/env python
import os
import os.path
import datetime
import shutil

homePath = os.path.expanduser("~")
vimrcSourcePath = os.path.join(os.getcwd(), "vim/vimrc")
vimrcTargetPath = os.path.join(homePath, ".vimrc")
print(".vimrc source path: ", vimrcSourcePath)
print(".vimrc target path: ", vimrcTargetPath)
if os.path.isfile(vimrcTargetPath) or os.path.islink(vimrcTargetPath):
    # Once a second updates of dotfiles is probably ok.
    # TODO: Append a guid if the backupfolder already exists.
    currentTime = datetime.datetime.now().strftime('%Y-%m-%d_%H%M%S')
    backupDir = currentTime + "_dotfilesBackup"
    backupPath = os.path.join(homePath, backupDir)
    os.mkdir(backupPath)
    print("cleaning up old files into directory: ", backupPath)
    shutil.move(vimrcTargetPath, backupPath)
    
os.symlink(vimrcSourcePath, vimrcTargetPath)
