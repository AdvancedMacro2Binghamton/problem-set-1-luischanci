****************************************
* Binghamton University                *
* PhD in Economics                     *
* ECON 634 Advanced Macroeconomics     *
* Fall 2017                            *
* Luis Chancí (lchanci1@binghamton.edu)*
****************************************
cd "C:\Users\Chanci\Dropbox\PhD\III. Third Year\1. ECON-634 Advanced Macroeconomics\Hw\hw1\problem-set-1-luischanci"

cd   build_data\input
u    PSID_Income_2001and2007, clear
drop if ER20456==.| ER41027==.
keep ER20456 ER41027

cd ..\..
cd analysis\input
export delimited using "income.csv", replace
clear all
****************************************
