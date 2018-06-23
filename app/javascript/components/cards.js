function selectCards() {
  const labels = document.querySelectorAll('.label-handle')
  labels.forEach((label) => {
    label.addEventListener("click", (event) => {
      const parent = event.currentTarget.parentNode
      parent.querySelectorAll('.label-handle').forEach((child) => {
        child.classList.toggle("hidden");
      });
    });
  });
}

export { selectCards };



