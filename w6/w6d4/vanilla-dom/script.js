document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const faveSubmit = document.querySelector(".favorite-submit");
  faveSubmit.addEventListener("click", (event) => {
    event.preventDefault();

    const placeField = document.querySelector(".favorite-input");
    const favePlace = placeField.value;
    placeField.value = "";

    const ul = document.querySelector("#sf-places");
    const li = document.createElement("li");
    li.textContent = favePlace;
    ul.appendChild(li);
  });


    // adding new photosphotoForm.className === "photo-form-container hidden"
  const showPhotoForm = document.querySelector(".photo-show-button");
  showPhotoForm.addEventListener("click", (event) => {
    const photoForm = document.querySelector(".photo-form-container");
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.classList.remove("hidden");
    } else {
      photoForm.classList.add("hidden");
    }
  });

  const imageSubmit = document.querySelector(".photo-url-submit");
  imageSubmit.addEventListener("click", (event) => {
    event.preventDefault();
    const imageUrl = document.querySelector(".photo-url-input");
    const imageLocation = imageUrl.value;
    imageUrl.value = "";

    const img = document.createElement("img");
    img.src = imageLocation;

    const li = document.createElement("li");
    li.appendChild(img);
    
    const dogPhotoUl = document.querySelector(".dog-photos");
    dogPhotoUl.appendChild(li);
  });


});
