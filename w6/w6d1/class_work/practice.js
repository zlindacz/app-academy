function makeChange(sum, ...denom) {
  let change = [];
  let total = 0;
  function tryType() {
    denom.forEach(type => {
    if (sum - total - type >= 0) {
      change.push(type);
      total += type;
      return tryType;
    } else {
      not_continue;
    }
  }
  return change;
}
