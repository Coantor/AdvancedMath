# 高等代数编程实现

#### Description
主要用matlab实现高等代数中一些矩阵问题的求解

#### Software Architecture
Software architecture description

#### 
目前实现以下功能:
1. 矩阵行列式求解,包括两个函数文件 `Det.m`,`Det2.m`。前者是通过行列式展开计算,后者是通过消元法求解.这两个函数的测试文件为`matrix_deternimant.m`,包括对这两个函数的测试以及与自带函数`det`计算速度的对比.
2. 方阵求逆，包括两个函数文件, `Inv.m`,`Inv2.m`。前者是先求解矩阵的伴随，后者是通过初等行变换实现.这两个函数的测试文件为 `matrix_inverse.m`,包括对这两个函数的测试以及与自带函数`inv`计算速度的对比.
3. 求矩阵以及向量组的秩.包括一个函数文件 `Calc_rank.m` 主要实现方法是矩阵的初等变换(目前仅仅实现了初等行变换),测试文件为 `matrix_rank.m`.

#### Instructions

1.  xxxx
2.  xxxx
3.  xxxx

#### Contribution

1.  Fork the repository
2.  Create Feat_xxx branch
3.  Commit your code
4.  Create Pull Request


#### Gitee Feature

1.  You can use Readme\_XXX.md to support different languages, such as Readme\_en.md, Readme\_zh.md
2.  Gitee blog [blog.gitee.com](https://blog.gitee.com)
3.  Explore open source project [https://gitee.com/explore](https://gitee.com/explore)
4.  The most valuable open source project [GVP](https://gitee.com/gvp)
5.  The manual of Gitee [https://gitee.com/help](https://gitee.com/help)
6.  The most popular members  [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
