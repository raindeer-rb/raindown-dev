const toc = document.querySelector('details#toc');
const minWidth = window.matchMedia('(min-width: 1024px)');

function toggleTOC(e) {
  if (e.matches) {
    toc.setAttribute('open', '');
  } else {
    toc.removeAttribute('open');
  }
}

minWidth.addEventListener('change', toggleTOC);
toggleTOC(minWidth);

document.addEventListener("DOMContentLoaded", () => {
  const headings = document.querySelectorAll("#content h2, #content h3, #content h4, #content h5, #content h6");
  
  const observerOptions = {
    root: null,
    rootMargin: "0px 0px -60% 0px", // Trigger when heading is in top 40% of screen.
    threshold: 0.1 // Trigger as soon as 10% of the heading is visible.
  };

  const observerCallback = (entries) => {
    entries.forEach((entry) => {
      const id = entry.target.getAttribute("id");
      const tocLink = document.querySelector(`#toc a[href="#${id}"]`);

      if (!tocLink) return;

      if (entry.isIntersecting) {
        document.querySelectorAll("#toc a").forEach((link) => {
          link.classList.remove("active");
        });
        tocLink.classList.add("active");
      }
    });
  };

  const observer = new IntersectionObserver(observerCallback, observerOptions);
  headings.forEach((heading) => observer.observe(heading));
});
