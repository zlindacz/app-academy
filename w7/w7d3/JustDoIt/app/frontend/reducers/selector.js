const allDoits = (state) => {
  const keys = Object.keys(state.doits);
  const ids = keys.map(key => (state.doits[key]));
  return ids;
};

export default allDoits;
