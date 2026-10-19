const details = document.querySelectorAll('aside#sidebar details');
const detailsMinWidth = window.matchMedia('(min-width: 768px)');

function toggleSummary(e) {
  if (e.matches) {
    details.forEach((element) => {
      element.setAttribute('open', '');
    })
  } else {
    details.forEach((element) => {
      element.removeAttribute('open');
    })
  }
}

detailsMinWidth.addEventListener('change', toggleSummary);
toggleSummary(detailsMinWidth);
