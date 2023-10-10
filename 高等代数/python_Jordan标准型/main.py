from JordanStandard import Calc_JordanStandard
import pandas as pd

a = pd.read_table("mat.txt",index_col=None,header=None,sep=" ").values

if __name__ == "__main__":
    Jordan_a = Calc_JordanStandard(a)
    print("a的Jordan标准型为:")
    print(Jordan_a)