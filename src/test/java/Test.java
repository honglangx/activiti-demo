/**
 * Created with IntelliJ IDEA.
 * User: wangbin
 * Date: 13-11-12
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */
public class Test {

    public static void main(String[] args) {

        for(int i=1;i<3;i++){
            System.out.println("a"+i);
            for(int j=1;j<2;j++){
                System.out.println("b"+i);
                if(j==1){
                   break;
                }

            }
        }

    }
}
