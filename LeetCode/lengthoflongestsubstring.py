# -*- coding: utf-8 -*-
"""
滑动窗口
Created on Fri Apr 24 10:23:12 2020

@author: WZYWXYWLY
"""
s = 'abcabcbb'

def lengthOfLongestSubstring(s):
    if not s:return 0
    left = 0
    lookup = set()
    n = len(s)
    max_len = 0
    cur_len = 0
    for i in range(n):
        cur_len += 1
        while s[i] in lookup:
#            print(lookup)
#            print(s[left])
            lookup.remove(s[left])
            left += 1
            cur_len -= 1
        if cur_len > max_len:max_len = cur_len
        lookup.add(s[i])
    return max_len

print(lengthOfLongestSubstring(s))
