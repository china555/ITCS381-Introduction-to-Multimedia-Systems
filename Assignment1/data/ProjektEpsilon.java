import java.util.Scanner;

public class ProjektEpsilon {
    public static void main(String[] args) {
        String data;
        int word_size;
        int num_blocks;
        Scanner input1 = new Scanner(System.in);
        System.out.println("Dataword");
        data = input1.nextLine();
        Scanner input2 = new Scanner(System.in);
        System.out.println("Word size");
        word_size = input2.nextInt();
        Scanner input3 = new Scanner(System.in);
        System.out.println("number of blocks");
        num_blocks = input3.nextInt();
        checksum_gen(data,word_size,num_blocks);
    }
    public static void checksum_gen(String dataword,int wordsize,int numblocks){
        char[][] arraydata = new char[numblocks][wordsize];
        char[] arraysum = new char[wordsize];     
        String[] temp = dataword.split(" ");
        boolean biterror = false;
        boolean notenoughbit = false;
        if(temp.length == 1){
            notenoughbit = true;
        }
        if (!notenoughbit){
            for (int x = 0; x < numblocks; x++){
                for (int y = 0; y < wordsize; y++){
                    char[] arraytemp;
                    arraytemp = temp[x].toCharArray();
                    if (arraytemp[y] == '0' || arraytemp[y] == '1'){
                        //System.out.println(x + "  DA" + y);
                        arraydata[x][y] = arraytemp[y];
                    }
                    else{
                        biterror = true;
                        break;
                    }
                }
            }
            if (!biterror){
                char sum = 0;
                for (int x = 0; x < wordsize ; x++){
                    for (int y  = 0 ; y < numblocks - 1; y++){
                        if (y == 0){
                            sum = addition( arraydata[y][x], arraydata[y+1][x]);
                        }
                        else{
                            sum = addition(sum, arraydata[y+1][x]);
                        }
                    }                
                    arraysum[x] = sum;
                }
                arraysum = inversesum(arraysum, wordsize);
                printresult(arraysum,wordsize,arraydata);
            }else{
                System.out.println("Error: There is a bit that is not 0 or 1");
            }
        }else{
            System.out.println("Error: Not enought bits to calculate checksum");
        }
    }
    public static char addition(char A,char B) {
        if ((A == '0' && B == '0') || (A == '1' && B == '1')){
            return '0';
        }   
        else{
            return '1';
        }
    }
    public static char[] inversesum(char[] array,int wordsize) {
        for (int x = 0;x < wordsize; x++){
            //System.out.println("A:"+array[x]);
            if (array[x] == '0'){
                array[x] = '1';
            }else{
                array[x] = '0';
            }
        }
        return array;
    }
    public static void printresult(char[] result,int word_size, char[][] array1) {
        System.out.print("The Checksum is:");
        for (int x = 0;x < word_size; x++){
            System.out.print(result[x]);
        }
        System.out.println();
        System.out.println("The pattern sent is:");
        for (int x = 0;x < array1.length;x++){
            for(int y = 0;y < array1[0].length;y++){
                System.out.print(array1[x][y]);
            }
            System.out.print(" ");
        }
        for (int x = 0;x < word_size; x++){
            System.out.print(result[x]);
        }
        System.out.println();
        System.out.println("The codeword is <If it is empty then it means that one can't be printed>:");
        System.out.println(getcodeword(result, word_size));
        
    }
    public static char getcodeword(char[] array,int wordsize) {
        int counter = 1;
        int sum = 0;
        for (int x = wordsize -1 ; x > 0;x--){
            if (array[x] == '1'){
                sum = sum + counter;
            }
            counter = counter * 2;
        }
        //System.out.println("Alpha"+sum);
        return (char)sum;
    }
}