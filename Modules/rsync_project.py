#!/usr/bin/env python2
# FileName      :: rsync_project.py
# Authors       :: Igor Ying Zhang, and Xin Xu
# Purpose       :: sync several python codes between cilent and several services
# Version       :: 1.0(20091029)
# Vevise        :: 2009-10-29
# History       :: 1.0) complete basic update function based on specified dictionary "CodeDict"
#                       CodeDict = {LocalPath:SeverList...}
#                       where :
#                       ServerList=[
#                           [UserName, ServerName,DirInServer], ...
#                           ]
#                       which matches the cmd of "rsync" as follow:
#                          rsync -av -e "ssh -l UserName" LocalPath ServerName:DirInServer
#
import os
import py_compile

class rsync_Proj:
    '''\
    Sync python codes between client and several sevices.\n\
    CodeDict = {LocalPath:SeverList...}\n\
    where:\n\
    ServerList=[\n\
        [UserName,ServerName,DirInServer], ...\n\
               ]\n\
    '''

    def __init__(self,dir,ictrl=0):
        self.CodeDict   = dir                                        # DIR need to sync.
        self.ICtrl      = ictrl                                      # 0 : default, same as 1
                                                                     # 1 : update '.pyc' only
                                                                     # 2 : update source codes
        return

    def rsync_List(self,DirList,Direction):
        for item in DirList:
            TmpList = item[:]
            TmpList.insert(1,Direction)
            os.system('rsync -av -e "ssh -l %s" %s %s:%s'
                % tuple(TmpList))
        return

    def update_Data(self):
        WorkDir = os.getcwd()
        HomeDir = os.getenv('HOME')
        PidNum  = os.getpid()
        Script  = HomeDir+'/scrip_'+'%s' %PidNum
        while os.path.isfile(Script):                                # creat and check script DIR 
            Script = Script+'1'
        os.mkdir(Script)
        for item in self.CodeDict.keys():
            tmpList=[]
            os.chdir(item)
            for tmpfile in os.listdir('.'):
                name, extension = os.path.splitext(tmpfile)
                if extension.lower()=='.py':
                    py_compile.compile(tmpfile)
                    try:
                        os.chmod('%s.pyc' % name,0750)
                    except:
                        pass
                    if self.ICtrl==0 or self.ICtrl==1:
                        try:
                            os.system('mv %s %s/%s'
                                %(tmpfile, Script,tmpfile))
                            tmpList.append(tmpfile)
                        except:
                            print 'error in moving %s to %s'\
                                % (tmpfile,Script)
                            sys.exit()
                    elif self.ICtrl==2:
                        pass
                    else:
                        print 'Error in invalid self.ICtrl (%d)'\
                            % self.ICtrl
            self.rsync_List(self.CodeDict[item],'%s/*' % item)
            print '====Avoid update :====\n %s' % tmpList
            for tmpfile in tmpList:
                try:
                    os.system('mv %s/%s %s/'
                        %(Script,tmpfile,item))
                except:
                    print 'error in moving %s/%s to %s'\
                        % (Script,tmpfile,item)
                    sys.exit()
        os.system('rm -r %s' % Script)
        os.chdir(WorkDir)
        return

