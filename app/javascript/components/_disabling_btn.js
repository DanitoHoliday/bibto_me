const toggler = document.getElementById("checky");
const reachOutBtn = document.getElementById("reach-out-btn");
toggler.addEventListener("click", (event) => {
  if (event.currentTarget.children[0].attributes['aria-expanded'].value === 'false') {
    reachOutBtn.classList.add('isDisabled')
  } else {
    reachOutBtn.classList.remove('isDisabled')
  }
});

export { toggler };
export { reachOutBtn };
