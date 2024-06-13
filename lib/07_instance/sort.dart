void main() {
  final nums = [3,2,5,1,3,];

  nums.sort((a, b) {
    if(a > b) {
      return 1;
    } else if (a < b) {
      return -1;
    }
    return 0;
  });
  print(nums);
}

//sort가 되는 애들은 코드 속에 comparable이 되어 있는것이다
//sort가 안되는 애들은 comparable을 구현해야 한다는 말이다
