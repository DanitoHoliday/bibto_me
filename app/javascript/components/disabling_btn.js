const disableHandler = () => {
  const toggler = document.getElementById("checky");
  const reachOutBtn = document.getElementById("reach-out-btn");
  if (toggler) {
     toggler.addEventListener("click", (event) => {
      console.log("pizza")
      if (event.currentTarget.children[0].attributes['aria-expanded'].value === 'false') {
        reachOutBtn.classList.add('isDisabled')
      } else {
        reachOutBtn.classList.remove('isDisabled')
      }
    });
  }
}

disableHandler();
export default disableHandler;
