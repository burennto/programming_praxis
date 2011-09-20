# Programming Praxis
# Exercise 9: A Self-Reproduction Program
# http://programmingpraxis.com/2009/02/20/a-self-reproducing-program/
#
# Author: Brent Chuang
# Date:   2/1/2011

puts File.open(__FILE__, "r").readlines
