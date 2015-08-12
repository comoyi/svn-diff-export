# svn_diff_export
=================
a sh for export changed files between two revision
----------
    [root@vm michael]# /home/html/michael/svn_diff_export.sh r22117 r22321  svn://192.168.0.333/repos/mc/branches/p1 /home/html/michael/testsvn_export_333
    ----------------------------------- start -----------------------------------
    > Summarize
    AM      svn://192.168.0.333/repos/mc/branches/p1/www/download/img
    AM      svn://192.168.0.333/repos/mc/branches/p1/www/download/img/test_1.php
    AM      svn://192.168.0.333/repos/mc/branches/p1/www/download/img/test_2.php
    AM      svn://192.168.0.333/repos/mc/branches/p1/www/download/img/test_3[1].php
    AM      svn://192.168.0.333/repos/mc/branches/p1/www/download/img/test_3.php
    > Start exporting changed files between revision r22117 and r22321
      to      /home/html/michael/testsvn_export_333
    [Success] /home/html/michael/testsvn_export_333/www/download/img
    [Success] /home/html/michael/testsvn_export_333/www/download/img/test_1.php
    [Success] /home/html/michael/testsvn_export_333/www/download/img/test_2.php
    [Success] /home/html/michael/testsvn_export_333/www/download/img/test_3[1].php
    [Success] /home/html/michael/testsvn_export_333/www/download/img/test_3.php
    -----------------------------------  end  -----------------------------------
