function reloadBannerImage() {
  const smallBanner = document.querySelector(".small-banner");
  if (smallBanner) {
    window.setInterval(changeImage, 8000);
  }
}

function changeImage() {
  const smallBanner = document.querySelector(".small-banner");
  const images = smallBanner.dataset.images.split(',');
  // find which image is displayed
  const backgroundImage = window.getComputedStyle(smallBanner).backgroundImage;
  const backgroundImageUrl = /url\("(.*)"\)/.exec(backgroundImage)[1];
  // console.log(Boolean(images[0] === backgroundImageUrl))
  let index = images.indexOf(backgroundImageUrl);
  let newBackgroundImageUrl = '';
  if(index < 1) {
    index += 1
    newBackgroundImageUrl = images[index];
  } else {
    newBackgroundImageUrl = images[0];
  }
  // find index in the images array
  // take next image if index < 2
  // else take first image
  smallBanner.style.backgroundImage = `url(${newBackgroundImageUrl})`;
}

export { reloadBannerImage };
