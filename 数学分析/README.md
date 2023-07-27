# 数学分析代码介绍

## 这个项目的目的

> 一个有纸、笔、橡皮擦并且能坚持严格行为准则的人，实质上就是一台通用图灵机。 
>
> ​																				------- 图灵

​	在数学分析的学习过程中,由于数学分析本身抽象的程度之高，我们很难用计算机进行辅助理解(毕竟不是高等数学，很多细节补考就)。但是总有一些问题和现象可以进行近似模拟，这样不仅能提升我本人的计算机能力而且也可以更加直观理解这些问题与现象。于时这个项目诞生了。并且，其中有些现象，笔者在对应的b站账号[https://www.bilibili.com/video/BV1fN411m7pu/?spm_id_from=333.999.0.0&vd_source=9117eec760f3fec5c937cd96ab06beaf]上也做出了理论解释，如下面清单的第二条。

## 实现的功能

​	鉴于笔者的水平有限，我们能实现的功能非常简单。下面是这些清单。

1. Wallis 公式的渐进估计。见`Wallis.R`。

   ![Wallis渐进估计](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/Wallis%E5%85%AC%E5%BC%8F.png)

2. 一个可微函数在某点导数大于0，但是在附近任意小的区间上函数都不单调。见`单调函数经典反列.R`。

   ![单调函数经典反列](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/%E5%8D%95%E8%B0%83%E5%87%BD%E6%95%B0%E7%BB%8F%E5%85%B8%E5%8F%8D%E5%88%97.png)

3. `Riemann`函数的可视化实现。见`Riemann.R`，其中`Max_CommonFactor.cpp`是辅助函数,用`C++`实现代码加速功能。

   ![Riemann函数](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/Riemann%E5%87%BD%E6%95%B0.png)

4. 基础三角函数的图像绘制，包括(3 (sin、cox、tan) +  3(倒数)  + 3(反函数))。

   ![基础三角函数图像](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/%E5%9F%BA%E7%A1%80%E4%B8%89%E8%A7%92%E5%87%BD%E6%95%B0%E5%9B%BE%E5%83%8F.png)

5. 一个经典的收敛反常积分，但是无穷远处极限不为0。(甚至这个函数的上极限为$+\infty$)。见`反常积分.R`。

   ![经典反常积分收敛的反列1](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/%E5%8F%8D%E5%B8%B8%E7%A7%AF%E5%88%86%E7%BB%8F%E5%85%B8%E5%8F%8D%E5%88%971.png)

   ![经典反常积分收敛的反列2](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/%E5%8F%8D%E5%B8%B8%E7%A7%AF%E5%88%86%E7%BB%8F%E5%85%B8%E5%8F%8D%E5%88%972.png)

6. 收敛的迭代系统得到的迭代点列$\{x_{n}\}$只有两种结果，单调或者分奇偶单调。见`迭代函数系统(part1).R`。

   ![迭代序列收敛系统1](http://gitee.com/cantour123/AdvancedAlgebra/blob/master/%E6%95%B0%E5%AD%A6%E5%88%86%E6%9E%90/picture/%E8%BF%AD%E4%BB%A3%E5%87%BD%E6%95%B0%E8%BF%AD%E4%BB%A3%E7%B3%BB%E7%BB%9F1.png)