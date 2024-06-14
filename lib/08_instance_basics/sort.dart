void main(){
  final nums = [1,2,3,4,3,2,1];

  nums.sort((a,b)=>b.compareTo(a));
  print(nums);
}