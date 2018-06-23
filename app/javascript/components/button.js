function updateTotalAmount() {
  // ajouter une classe aux lockers principaux
  // const lockedIcons = document.querySelectorAll('.hidden .fa-lock')
  const lockedIcons = document.querySelectorAll('.card-supplier-image .supplier-lock .fa-lock');
  const amount = document.getElementById('amount');
  let totalPrice = parseFloat(amount.dataset.amount);
  lockedIcons.forEach((icon) => {
    const card = icon.closest('.card-supplier');
    const priceCard = parseInt(card.querySelector('.card-price').innerText.replace(/\s/g, ''));
    totalPrice += priceCard;
  });
  amount.innerText = totalPrice;
}

function clickingLock(lock) {
  lock.addEventListener("click", (event) => {
    const lockIcon = lock.querySelector('i');
    if (lockIcon.classList.contains("fa-lock-open")) {
      lockIcon.classList.remove("fa-lock-open");
      lockIcon.classList.add("fa-lock");
      toggleServicesAvailability(lock);
    } else {
      lockIcon.classList.remove("fa-lock");
      lockIcon.classList.add("fa-lock-open");
      toggleServicesAvailability(lock);
    }
    updateTotalAmount()
  });
};

function toggleServicesAvailability(lock) {
  const service = lock.dataset.service;
  const supplierId = lock.dataset.supplierId;
  const locks = document.querySelectorAll(`#${service} .supplier-lock`);
  locks.forEach((lockTwo) => {
    if (lockTwo.dataset.supplierId != supplierId) {
      lockTwo.classList.toggle('hidden');
    }
  });
}

function lockingLock() {
  const locks = document.querySelectorAll(".supplier-lock");
  locks.forEach((lock) => {
      clickingLock(lock);
    })
}

export { lockingLock };



//part of former lockingLock function
  // if (locks) {
  //   locks.forEach((lock) => {
  //     mouseOver(lock);
  //   })
  // }
  // const animationLocks = document.querySelectorAll(".supplier-lock-animation");
  // if (animationLocks) {
  //   animationLocks.forEach((animationLock) => {
  //     mouseOut(animationLock);
  //     clickingLock(animationLock);
  //   })
  // }
  // onlyOneLock();
//

// function onlyOneLock() {
//   const locked = document.querySelector(".fa-lock")
//   console.log(locked);
//   if (locked) {
//     const locks = document.querySelectorAll(".supplier-lock");
//     locks.forEach((lock) => {
//       lock.classList.add('hidden');
//     })
//     const animationLocks = document.querySelectorAll(".supplier-lock-animation");
//     animationLocks.forEach((animationLock) => {
//       animationLock.classList.add('hidden');
//     })
//   }
// }
// function mouseOver(lock) {
//   lock.addEventListener("mouseover", (event) => {
//     lock.classList.add('hidden');
//     const lockIcon = lock.querySelector('i');
//     const animation = lock.parentNode.querySelector('.supplier-lock-animation');
//     const animationIcon = animation.querySelector('i');
//     animation.classList.remove('hidden');
//     if (lockIcon.classList.contains("fa-lock-open")) {
//       animationIcon.classList.remove("fa-lock-open");
//       animationIcon.classList.add("fa-lock");
//     } else {
//       animationIcon.classList.remove("fa-lock");
//       animationIcon.classList.add("fa-lock-open");
//     }
//   })
// };
// function mouseOut(animationLock) {
//   animationLock.addEventListener("mouseout", (event) => {
//     animationLock.classList.add('hidden');
//     const lock = animationLock.parentNode.querySelector('.supplier-lock');
//     lock.classList.remove('hidden');
//   });
// };
