# -*- coding: utf-8 -*-
"""
Created on Tue Apr 21 21:28:52 2020

@author: WZYWXYWLY
"""
import string

s = [3,'aba','ab','sjaklejfklasdjfgkelsajgslkaejklahsjkalehrjklasvhdsjakfe']

t = s[0]

for i in range(t):
    str1 = s[i+1]
    num_case = [str1.count(i) for i in string.ascii_lowercase]
    even_num = 0
    odd_num = 0
    for num in num_case:
        if num%2==0:
            even_num = even_num + 1
        else:
            odd_num = odd_num + 1
    if odd_num % 2 != 0 or odd_num==0:
        print('C wins')
    else: 
        print('E wins')
    
    ## [chr(i) for i in range(97,123)]
    ## .join([chr(i) for i in range(97,123)])
    ## string.ascii_lowercase
    ## countdict = dict.fromkeys(string.ascii_lowercase, 0)