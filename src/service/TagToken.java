package service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class TagToken {
	
	public List<String> split(String tag){
		List<String> list = new ArrayList<String>();
		
		StringTokenizer token = new StringTokenizer(tag," #");
		
		while(token.hasMoreTokens()) {
			list.add(token.nextToken());
		}
		
		return list;
	}
}
