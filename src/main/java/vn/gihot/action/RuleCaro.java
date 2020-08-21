package vn.gihot.action;

import javax.swing.*;

public class RuleCaro {
    final  int size = 6;
    public int[][] matrix = new int[size][size];
    public boolean checkWin(int i, int j){
        int d = 0,k = i,h;
//        TODO check row
        while (matrix[i][k] == matrix[i][j]  ){
            d++;
            k++;
            if(k>=size){
                break;
            }
        }

        k = i -1;
        while (matrix[i][k] == matrix[i][j]){
            d++;
            k--;
            if(k<0){
                break;
            }
        }
        if (d>4){
            return  true;
        }
//        TODO check column
        d = 0;
        h = j;
        while (matrix[h][j] == matrix[i][j]){
            d = d + 1;
            h = h + 1;
            if(h>=size){
                break;
            }
        }
        h = j - 1;
        while (matrix[h][j] == matrix[i][j]){
            d = d + 1;
            h = h - 1;
            if(h < 0){
                break;
            }
        }
        if (d>4){
            return true;
        }
//       TODO check cross 1
        h = i;
        k =j;
        d = 0;
        while (matrix[h][k] == matrix[i][j]){
            d = d + 1;
            h = h + 1;
            k = k + 1;
            if(k>=size || h >=size){
                break;
            }

        }
        h = i -1;
        k = j -1;
        while(matrix[h][k] == matrix[i][j]){
            d = d + 1;
            h = h - 1;
            k = k - 1;
            if(k<0||h<0){
                break;
            }
        }
        if (d>4){
            return true;
        }
//        TODO check cross 2
        h = i;
        k = j;
        d = 0;
        while (matrix[h][k] == matrix[i][j]){
            d = d + 1;
            h = h + 1;
            k = k - 1;
            if(h>=size || k <0){
                break;
            }
        }
        h = i -1;
        k = j + 1;
        while (matrix[h][k] == matrix[i][j]){
            d = d + 1;
            h = h - 1;
            k = k + 1;
            if(k>=size || h < 0){
                break;
            }
        }
        if (d>4){
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        RuleCaro ruleCaro = new RuleCaro();
        for (int i = 0; i< ruleCaro.matrix.length; i++){
            for (int j = 0; j< ruleCaro.matrix.length;j++){
                ruleCaro.matrix[i][j] = 0;
            }
        }
//        for (int i = 0; i< ruleCaro.matrix.length; i++){
//            ruleCaro.matrix[i][i] = 1;
//        }

        for (int i = 0; i< ruleCaro.matrix.length; i++){
            System.out.print("\n");
            for (int j = 0; j< ruleCaro.matrix.length;j++){
                System.out.print(" " + ruleCaro.matrix[i][j] + " ");
            }
        }


    }
}
