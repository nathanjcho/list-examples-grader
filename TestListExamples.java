import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.*;

public class TestListExamples {
  // Write your grading tests here!
  @Test
    public void testMerge(){
        List<String> list1 = new ArrayList<>();
        List<String> list2 = new ArrayList<>();
        List<String> merged = new ArrayList<>();
        list2.add("hi");

        merged.add("hi");

        assertArrayEquals(merged.toArray(),ListExamples.merge(list1, list2).toArray());
        
    }

    @Test
    public void filterTest1(){
        List<String> list = new ArrayList<>();
        list.add("apple");
        list.add("banana");
        //list.add("apple");

        StringChecker sc = new StringChecker(){
            public boolean checkString(String s){
                if(s.equals("apple")|| s.equals("banana")){
                    return true;
                }
                return false;
            }
        };
        List<String> newArr = new ArrayList<String>();
        newArr.add("apple");
        newArr.add("banana");
        assertArrayEquals(newArr.toArray(),ListExamples.filter(list, sc).toArray());
    }


  
}