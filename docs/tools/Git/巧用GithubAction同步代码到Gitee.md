
巧用GithubAction同步代码到Gitee
http://yikun.github.io/2020/01/17/%E5%B7%A7%E7%94%A8Github-Action%E5%90%8C%E6%AD%A5%E4%BB%A3%E7%A0%81%E5%88%B0Gitee/


生成/添加SSH公钥：

本机执行：
ssh-keygen -t rsa -C "ypungzil@163.com" 

cat ~/.ssh/id_rsa.pub


生成/添加SSH公钥参考
https://gitee.com/help/articles/4181#article-header0


添加SSH公钥
https://gitee.com/profile/sshkeys


steps:
- name: Mirror the Github organization repos to Gitee.
  uses: youngzil/notes@master
  with:
    src: github/notes
    dst: gitee/notes
    dst_key: ${{ secrets.GITEE_PRIVATE_KEY }}
    dst_token: ${{ secrets.GITEE_TOKEN }}
    account_type: user





