document.addEventListener('DOMContentLoaded', function () {
  const content = document.querySelector('.cv-content');
  if (!content) return;

  const headings = Array.from(content.querySelectorAll(':scope > h1'));
  if (headings.length === 0) return;

  // Sections that should be expanded by default
  const expandedByDefault = ['summary', 'skills'];

  headings.forEach(function (heading) {
    // Collect all siblings until next h1
    const siblings = [];
    let next = heading.nextElementSibling;
    while (next && next.tagName !== 'H1') {
      siblings.push(next);
      next = next.nextElementSibling;
    }

    // Create section wrapper
    const sectionId = heading.textContent
      .trim()
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)/g, '');

    const isExpanded = expandedByDefault.includes(sectionId);

    const wrapper = document.createElement('div');
    wrapper.className = 'cv-section';
    wrapper.id = sectionId;
    wrapper.setAttribute('x-data', '{ open: ' + isExpanded + ' }');

    // Create clickable header
    const header = document.createElement('div');
    header.className = 'cv-section-header';
    header.setAttribute('x-on:click', 'open = !open');

    const chevron = document.createElement('span');
    chevron.className = 'chevron';
    chevron.setAttribute('x-text', "open ? '\\u25BC' : '\\u25B6'");

    header.appendChild(chevron);
    header.appendChild(heading.cloneNode(true));

    // Create collapsible body
    const body = document.createElement('div');
    body.className = 'cv-section-body';
    body.setAttribute('x-show', 'open');
    body.setAttribute('x-transition:enter', 'transition-enter');
    body.setAttribute('x-transition:enter-start', 'transition-enter-start');
    body.setAttribute('x-transition:enter-end', 'transition-enter-end');
    body.setAttribute('x-transition:leave', 'transition-leave');
    body.setAttribute('x-transition:leave-start', 'transition-leave-start');
    body.setAttribute('x-transition:leave-end', 'transition-leave-end');

    siblings.forEach(function (el) {
      body.appendChild(el);
    });

    wrapper.appendChild(header);
    wrapper.appendChild(body);

    // Replace original heading with wrapper
    heading.parentNode.replaceChild(wrapper, heading);
  });

  // Initialize scroll-spy
  initScrollSpy();
});

function initScrollSpy() {
  const sections = document.querySelectorAll('.cv-section');
  const navLinks = document.querySelectorAll('.sidebar-nav a');

  if (sections.length === 0 || navLinks.length === 0) return;

  const observer = new IntersectionObserver(
    function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          const id = entry.target.id;
          navLinks.forEach(function (link) {
            link.classList.toggle('active', link.getAttribute('href') === '#' + id);
          });
        }
      });
    },
    { rootMargin: '-20% 0px -60% 0px' }
  );

  sections.forEach(function (section) {
    observer.observe(section);
  });
}

function navigateToSection(sectionId) {
  const section = document.getElementById(sectionId);
  if (!section) return;

  // Expand the section via Alpine
  const alpineData = Alpine.$data(section);
  if (alpineData) {
    alpineData.open = true;
  }

  // Smooth scroll
  setTimeout(function () {
    section.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }, 50);
}
