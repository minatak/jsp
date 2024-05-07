package study2.mapping;

public class Test3Service {

	public int hap(int su1, int su2) {
		return su1 + su2;
	}

	public int cha(int su1, int su2) {
		return su1 - su2;
	}

	public int gop(int su1, int su2) {
		return su1 * su2;
	}

	public String mok(int su1, int su2) {
		String mok = su2==0? "계산 불가" : su1 / su2 +"";
		return mok;
	}

}
