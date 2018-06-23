function selectList() {
  const labels = document.querySelectorAll('.list-element .angle');

  labels.forEach((label) => {
    label.addEventListener("click", (event) => {
      const listElement = event.currentTarget.closest(".list-element");

      // const showElement = document.getElementById("#bundle-line-details-<%= bundle_line.id %>");
      // showElement.classList.toggle("collapse show")
      document.querySelectorAll(".bundle-recap .collapse.in").forEach((element) => {
        const bundleLine = element.closest(".bundle-recap");
        const bundleListElement = bundleLine.querySelector(".list-element");

        console.log(bundleListElement);

        if (bundleListElement != listElement) {
          element.classList.remove("in");
        }
      });

      // disable any existing active list
      document.querySelectorAll(".list-element.active-element").forEach((element) => {
        if (element != listElement) {
          const angle = element.querySelector(".angle .fas");

          angle.classList.remove("fa-angle-down");
          angle.classList.add("fa-angle-right");

          element.classList.remove("active-element");
        }
      });

      // toggle the list we just clicked on
      listElement.classList.toggle("active-element");

      event.currentTarget.querySelector(".fas").classList.toggle("fa-angle-down");
      event.currentTarget.querySelector(".fas").classList.toggle("fa-angle-right");
    });
  });
}

export { selectList };



