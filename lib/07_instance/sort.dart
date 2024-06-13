void main() {
  final nums = [
    [2, 4],
    [1, 3],
    [5, 2],
    [2, 6]
  ];

  nums.sort((a, b) => a[0].compareTo(b[0]));
  print(nums);
  nums.sort((a, b) => -a[0].compareTo(b[0]));
  // 위와 같다 nums.sort((a, b) => b[0].compareTo(a[0]));
  print(nums);

  nums.sort((a, b) => a[1].compareTo(b[1]));
  print(nums);
  nums.sort((a, b) => b[1].compareTo(a[1]));
  print(nums);
}
