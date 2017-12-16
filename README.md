
# svn-diff-export

## a sh for export changed files between two revision of svn

----------
    [root@vm michael]# /home/html/michael/svn-diff-export.sh r22117 r22321  svn://192.168.0.333/repos/mc/branches/project /home/html/michael/test_svn_export_333
    ----------------------------------- start -----------------------------------
    > username: michael
    > password:

    > Summarize
    AM      svn://192.168.0.333/repos/mc/branches/project/www/download/download.php
    AM      svn://192.168.0.333/repos/mc/branches/project/www/download/img
    AM      svn://192.168.0.333/repos/mc/branches/project/www/download/img/test_1.jpg
    AM      svn://192.168.0.333/repos/mc/branches/project/www/download/img/test_2.jpg
    AM      svn://192.168.0.333/repos/mc/branches/project/www/download/img/test_3[1].jpg
    AM      svn://192.168.0.333/repos/mc/branches/project/www/download/img/test_3.jpg
    > Start exporting changed files between revision r22117 and r22321
      to      /home/html/michael/test_svn_export_333
    [Success] /home/html/michael/test_svn_export_333/www/download/download.php
    [Success] /home/html/michael/test_svn_export_333/www/download/img
    [Success] /home/html/michael/test_svn_export_333/www/download/img/test_1.jpg
    [Success] /home/html/michael/test_svn_export_333/www/download/img/test_2.jpg
    [Success] /home/html/michael/test_svn_export_333/www/download/img/test_3[1].jpg
    [Success] /home/html/michael/test_svn_export_333/www/download/img/test_3.jpg
    -----------------------------------  end  -----------------------------------

