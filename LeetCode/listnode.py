# -*- coding: utf-8 -*-
"""
Created on Wed Apr 22 22:06:19 2020

@author: WZYWXYWLY
"""

nums1 = [0]
nums2 = [7,3]

class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

def appendlistnode(x,nums):
    tail = x
    if tail == None:
        head = ListNode(nums[0])
        tail = head
        nums = nums[1:]
    for value in nums:
        tail.next = ListNode(value)
        tail = tail.next
    return head

def printlistnode(x):
    tail = x
    if tail == None:
        return None
    while not tail == None:
        print(tail.val)
        tail = tail.next

def getdatalistnode(x):
    tail = x
    a = []
    n = 0
    while not tail == None:
        a.append(tail.val*10**n)
        n = n + 1
        tail = tail.next
    return a

list1 = appendlistnode(None,nums1)
list2 = appendlistnode(None,nums2)
a = getdatalistnode(list1)
b = getdatalistnode(list2)
sum(a)+sum(b)


printlistnode(list1)

def addTwoNumbers(l1,l2):
    head = ListNode(0) ##初始化
    x = head
    tail1 = l1
    tail2 = l2
    while tail1 != None or tail2 != None:
        if tail1 != None and tail2 != None:
            k = tail1.val + tail2.val
            if head.val >=10:
                head.next = ListNode(k + 1)
                head.val = head.val - 10
            else:
                head.next = ListNode(k)
            head = head.next
            tail1 = tail1.next
            tail2 = tail2.next
        elif tail1 == None and tail2 != None:
            k = tail2.val
            if head.val >=10:
                head.next = ListNode(k + 1)
                head.val = head.val - 10
            else:
                head.next = ListNode(k)
            head = head.next
            tail2 = tail2.next
        elif tail2 == None and tail1 != None:
            k = tail1.val
            if head.val >=10:
                head.next = ListNode(k + 1)
                head.val = head.val - 10
            else:
                head.next = ListNode(k)
            head = head.next
            tail1 = tail1.next
    if head.val >= 10:
        head.next = ListNode(1)
        head.val = head.val - 10
    x = x.next
    return x

l3 = addTwoNumbers(list1,list2)
printlistnode(l3)
