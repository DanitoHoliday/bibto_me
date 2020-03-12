const toggleCategories =() => {
  const cards = document.querySelectorAll('.category-card')
  cards.forEach(card => {
    card.addEventListener("click", evt => {
      cards.forEach((card) => {
        card.classList.remove('active');
      });
      card.classList.add('active');
    })
  })
}
