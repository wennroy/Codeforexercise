# -*- coding: utf-8 -*-
"""
Created on Fri Apr 24 11:49:32 2020

@author: WZYWXYWLY
"""

## 这是字符串！！！！！！！

S = "ADOBECODEBANC"
T = "ABC"
'''
def minWindow(s,t):
    if not t or not s: return ""
    left = 0
    n = len(s)
    st = set()
    st0 = set(t)
    min_len = float("inf")
    cur_len = 0
    cur_s = ''
    min_s = ''
    for i in range(n):
        cur_len += 1
        st = set(s[left:cur_len + left+ 1])
        if st0.issubset(st):
            while st0.issubset(st):
                left += 1
                cur_len -= 1
                st = set(s[left:cur_len+1 + left])
            if cur_len < min_len - 1 : min_s = s[left - 1:cur_len + left + 1]
    return min_s

minWindow(S,T)
minWindow('a','a')

仅考虑不重复的字符串的情况
'''

'''
利用[t.count(i) for i in string.ascii_letters] 来替代 set()
'''
S = 'a'
T = 'aa' 

S = "cabwefgewcwaefgcf"
T = "cae"

'''
def minWindow(s,t):
    import string
    if not t or not s: return ""
    n = len(s)
    left = 0
    st = []
    st0 = [t.count(i) for i in string.ascii_letters]
    min_len = float("inf")
    cur_len = 0
    min_s = ''
    i = 0
    while i < n:
        cur_len += 1
        st = [s[left:i + 1].count(k) for k in string.ascii_letters]
#        print(left,i + 1)
#        print(s[left:i+1])
        if set([st0[k]<=st[k] for k in range(len(st))]) == {True}:
#            print(s[left:i])
            while set([st0[k]<=st[k] for k in range(len(st))]) == {True}:
                left += 1
                cur_len -= 1
                st = [s[left:i + 1].count(k) for k in string.ascii_letters]
#            print(s[left - 1:i])
#            print(cur_len,min_len)
            if cur_len < min_len - 1 :
                min_s = s[left - 1:i + 1]
                min_len = cur_len + 1
                i -= 1
                cur_len -= 1
        i += 1
    return min_s


上述利用滑动框查找最后超时，大概由于
'''

from collections import Counter
from collections import defaultdict

def minWindow(s,t):
    l = 0
    ans = s + s
    n = len(s)
    target = Counter(t)
    counter = defaultdict(lambda: 0)
    
    def contains(counter, target):
        if len(counter) < len(target):
            return False
        for k in counter:
            if k not in target or counter[k] < target[k]:
                return False
        return True
    
    for r in range(n):
        if s[r] in target:
            counter[s[r]] += 1
        while l < n and contains(counter, target):
            if r - l + 1 < len(ans):
                ans = s[l:r + 1]
            if s[l] in target:
                counter[s[l]] -= 1
            l += 1
    return "" if ans == s + s else ans
