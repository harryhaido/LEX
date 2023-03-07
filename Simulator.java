public class Simulator {
    public static boolean run ( DFA dfa, String input ) {
        String s = dfa.startState;
        int len = input.length();
        int i = 0;
        char c = input.charAt(0);
        while(dfa.transitions.containsKey(s+"_"+c) && i < len) {
            //System.out.print(s+"_"+c+" ");
            s = dfa.transitions.get(s+"_"+c);
            //System.out.println(s);
            i++;
            if(i < len)  {
                c = input.charAt(i);
                //System.out.println(i);
            }
        }
        //System.out.println(i+" and "+ len);
        if(dfa.finalStates.contains(s) && i == len) {
            return true;
        }
    return false;
    }
}