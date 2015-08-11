# svn_diff_export
a sh for export changed files between two revision

[root@mc mydata]# ./svn_diff_export.sh 1 6 file:///root/mydata/svn/p1 /root/mydata/p1
------- start -------
> Summarize
A       file:///root/mydata/svn/p1/d2
A       file:///root/mydata/svn/p1/d2/f2
D       file:///root/mydata/svn/p1/f1
> Start exporting changed files between revision 1 and revision 6 to /root/mydata/p1
/root/mydata/p1/d2
/root/mydata/p1/d2/f2
-------  end  -------
