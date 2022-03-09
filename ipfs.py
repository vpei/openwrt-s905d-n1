#!/usr/bin/env python3

import sys
import datetime
import hashlib
from cls.StrText import StrText
from cls.LocalFile import LocalFile
from cls.NetFile import NetFile

print("Working on it.")

cid = ''
# 获取传递的参数
try:
    #0表示文件名，1后面都是参数 0.py, 1, 2, 3
    ipfs = sys.argv[1:][0]
    if(len(sys.argv[1:]) > 1):
        cid = sys.argv[1:][1][:46]
    print('ipfs: ' + ipfs + '-' + cid[:46] + '-0')
except:
    ipfs = 'ipns'
    print('ipfs: ' + ipfs)

# 下载链接，测试是否连通
nodes = LocalFile.read_LocalFile('./ipfs/ipfs.txt')
# print("Get-IPFS-Info: \n" + nodes)
expire = ''
tmp = ''
old_ipfs_node = ''
new_ipfs_node = ''
if(ipfs == 'ipfs'):
    # 如果CID参数未传递成功，则从本地文件中获取
    if(cid == ''):
        with open("./ipfs/tmp/001.out", "r", encoding='utf-8') as f:  # 打开文件
            lines = f.readlines() #读取所有行
            #first_line = lines[0] #取第一行
            last_line = lines[-2] #取最后一行
        cid = StrText.get_str_btw(last_line, 'added ', ' ', 0)
    #for i in range(len(nodes)):
    # cid = 'Qma4Gq4wYkorNJ4pL4bfpkVSJJ1E2BZR2bP5HSAPg3HDUJ'
    ii = 0
    for j in nodes.split('\n'):
        try:
            #j = nodes[i]
            if(new_ipfs_node.find(j) == -1 and old_ipfs_node.find(j) == -1):
                    resurl = j + '/ipfs/' + cid + '/'
                    #resurl = j.replace(':hash', cid + '/')
                    print('\n' + (datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S") + '\n' + str(ii) + '-' + resurl)
                    expire = NetFile.url_to_str(resurl + '?file=name.html', 25, 60)
                    expire = NetFile.url_to_str(resurl + 'ipfs.txt', 25, 60)
                    readme = LocalFile.read_LocalFile("./ipfs/ipfs.txt")
                    #print('ipfs:\nlocal-readme\n' + readme + '\nnet-readme\n' + expire)
                    if (hashlib.md5(readme.encode("utf-8")).hexdigest() == hashlib.md5(expire.encode("utf-8")).hexdigest()):
                        print('hashlib.md5-True-' + resurl)
                    else:
                        print('hashlib.md5-False-' + j)
            if(ii >= 20):
                break
            else:
                ii += 1
        except Exception as ex:
             print("Line-69:" + str(ex))
        old_ipfs_node = old_ipfs_node + '\n' + j
    #LocalFile.write_LocalFile('./res/ipfs', new_ipfs_node.strip('\n') + '\n\n' + old_ipfs_node.strip('\n'))       
#elif(ipfs == 'ipns'):
else:
    #for i in range(len(nodes)):.
    ii = 0
    for j in nodes.split('\n'):
        try:
            #j = nodes[i]
            if(new_ipfs_node.find(j) == -1 and old_ipfs_node.find(j) == -1):
                resurl = j + '/ipns/k51qzi5uqu5dgc33fk7pd3093uw5ouejcyhwicv6gtfersoetui51qxq62zn5a/'
                #resurl = j.replace('/ipfs/:hash', '/ipns/k51qzi5uqu5dgc33fk7pd3093uw5ouejcyhwicv6gtfersoetui51qxq62zn5a/')
                print('\n' + (datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S") + '\n' + str(ii) + '-' + resurl)
                expire = NetFile.url_to_str(resurl + '?file=name.html', 50, 120)
                expire = NetFile.url_to_str(resurl + 'ipfs.txt', 50, 120)
                readme = LocalFile.read_LocalFile("./ipfs/ipfs.txt")
                #print('ipns:\nlocal-readme\n' + readme + '\nnet-readme\n' + expire)
                if (hashlib.md5(readme.encode("utf-8")).hexdigest() == hashlib.md5(expire.encode("utf-8")).hexdigest()):
                    print('hashlib.md5-True-' + resurl)
                    if(ii < 5):
                        tmp = tmp + '\n- ' + resurl
                else:
                    print('hashlib.md5-False-' + resurl)
                if(ii >= 20):
                    break
                else:
                    ii += 1
        except Exception as ex:
            print("Line-98-ipfs.py:" + str(ex) + '\nj：' + j)
            LocalFile.write_LocalFile('./tmp/err.log', '\nLine-105-ifs.py-Exception:' + str(ex) + '\nj：' + j)
        old_ipfs_node = old_ipfs_node + '\n' + j
    #print(tmp)
    # 打开本地ReadMe文件
    readme = ''
    #with open("./README.md", "r", encoding='utf-8') as f:  # 打开文件
    #    readme = f.read()  # 读取文件
    #readme = LocalFile.read_LocalFile("./res/README.md")
    #readme = readme.replace("ipfs_auto_url", tmp.strip('\n'))
    # 写入节点到本地ReadMe文件
    #LocalFile.write_LocalFile('./README.md', readme)
    print('ReadMe文件成功写入。')
#else:
#    print('运行时，缺少ipfs或ipns参数！')