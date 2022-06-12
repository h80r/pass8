List<String> trimInator(List<String> input) {
  return {
    ...input,
    ...input.map((w) => w.splitMapJoin(' ', onMatch: (m) => ''))
  }.toList();
}
