1. 误把文件夹提交到的git仓库,清除远程库中的文件夹,本地工作区保留

   ```sh
   git rm -r --cached  [要删除的文件夹]
   git commit -m "msg"
   
   #别忘了在 .gitignore文件中加上此文件夹
   #  dirname/
   ```

2. git clone --depth=1 无法切换到其他分支

   ```sh
   git clone --depth 1 https://github.com/dogescript/xxxxxxx.git
   git remote set-branches origin 'remote_branch_name'
   git fetch --depth 1 origin remote_branch_name
   git checkout remote_branch_name
   ```

   