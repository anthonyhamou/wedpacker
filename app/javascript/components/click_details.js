function clickDetails() {
  const details = document.querySelectorAll(".card-details");
  const returnButtons = document.querySelectorAll(".fa-angle-down")
  details.forEach((detail) => {
    detail.addEventListener('click', (event) => {
      const description = document.querySelector(".place-description:not(.hidden)");
      description.classList.add("open");
    });
  });
  returnButtons.forEach((returnButton) => {
    returnButton.addEventListener('click', (event) => {
      const description = document.querySelector(".place-description:not(.hidden)");
      description.classList.remove("open");
    });
  });
}

export { clickDetails };
