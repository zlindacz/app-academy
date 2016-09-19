export const BenchConstants = {
  RECEIVE_BENCHES: "RECEIVE_BENCHES",
  REQUEST_BENCHES: "REQUEST_BENCHES"
};

export const requestBenches = () => ({
  type: REQUEST_BENCHES
});

export const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
});
