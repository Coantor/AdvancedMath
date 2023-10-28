import numpy as np

def show_mat(a:np.array,precision = 2):
    """
    清晰打印矩阵
    """
    if len(a.shape) == 2:
        for i in range(a.shape[0]):
            for j in range(a.shape[1]):
                print("%.2f"%a[i,j],end=" ")
            print(end="\n")
    elif len(a.shape) == 1:
        print("[ ",end="")
        for j in range(a.shape[0]):
                print("%.2f"%a[j],end=" ")
        print(end="]\n")
    pass

def cal_matrix_k(a:np.array,k = 1/2):
    vals,vecs = np.linalg.eig(a)
    a_half = vecs @ np.diag(np.power(vals,k)) @ vecs.T
    return(a_half)


if __name__ == "__main__":
    a = np.round(np.random.rand(4,4) *5,0)
    # 生成正定矩阵
    a = a.T @ a
    a_half = cal_matrix_k(a)
    show_mat(a_half @ a_half)

    print("-"*50)
    a_three = cal_matrix_k(a,1/3)

    show_mat(a_three @ a_three @ a_three)