function tabs() {
  const tabs = document.querySelectorAll('.tab');
  const tabContents = document.querySelectorAll('.tab-content');
  tabs.forEach((tab) => {
    tab.addEventListener("click", (event) => {
      // remove active from all possible active class
      tabs.forEach((tab2) => {
        tab2.classList.remove('active');
      })
      const futureActiveTab = event.currentTarget;
      // add active class
      futureActiveTab.classList.add('active');
      // get data-target from html that has the same name that the id of the hidden div
      const tabContentId = futureActiveTab.dataset.target;
      // add hidden class for all possible not hidden class on tab-content div
      tabContents.forEach((tabContent) => {
        tabContent.classList.add('hidden');
      })
      // get the active tab hidden div
      const currentTabContent = document.getElementById(tabContentId);
      // remove hidden form this div
      currentTabContent.classList.remove('hidden');
    })
  })
}


export { tabs }
