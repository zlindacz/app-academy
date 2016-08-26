export const fetchDoits = (success, error) => {
  $.ajax({
    method: 'GET',
    url: '/api/doits',
    dataType: "JSON",
    success,
    error
  });
};
