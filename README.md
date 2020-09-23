# Côrtex.Earth

Côrtex.earth is a tool for "frictionless contemplation."

Designed from first principles to liberate scientific data from PDF fossilization, Côrtex.earth endeavors to reimagine the saving, sorting, and sharing of scientific knowledge. It is intended to compliment JupyterLab's analysis, coding, and working of scientific work.

### Problem

Time is our most precious resource in this life. Yet think back to the endless hours wasted searching for the right PDF, rummaging through email attachments, scrounging for the right Excel file in a tsunami of folders. Time that should have been spent reading and contemplating. I've found current citation manager have cumbersome interfaces, awkward usability, and antiquated UX. The key culprit is the PDF, which optimizes for print but cripples for digital.

### Goals

1. UNIVERSAL ACCESS: Côrtex.earth is designed to be useable by a doctor working in the Papua New Guinea highlands. She needs the app to be free of cost, device-agnostic, light storage footprint, and offline accessible.
2. PURE DIGITAL: Raw strings and ints where possible. Media & databases lazy-loaded via network. Data should be separate from its view.
3. POWER ANNOTATION: Easily save snippets of knowledge (synapses) from an article/book. Tags instead of folders. Create playlists of knowledge (cascades) that can be shared and subscribed to. Create tasks directly linked to items.
4. FUTURISTIC: Using the app should feel smooth, fast, reliable, and futuristic. RL Star Trek.

#### Stretch Goals
- Ability to rate an article by factors other than views, citations, and “journal impact factor”  (ie. Appropriate Test of Hypothesis, Detailed, Originality,  *need input
- Digitally enhance journals with open-source evaluation and sharing platform. Easily give feedback and annotations. Decrease power of for-profit publishers.
- Subscribed feeds from journals, clubs, classes, working groups, projects in one place.
- Fun easy journal clubs. Share cascades. Don’t have to email PDFs anymore. 
- Speaker can send out a slideshow, that then auto-syncs with the same slideshow on a viewer’s device. Viewer can synapse parts of slideshow instead of taking screenshots or photos. Speaker can embed realtime interactive components (polls, QA, )
- Create location for scientists to consolidate and evolve verified scientific consensus 
- From consensus, create free educational tool for all humans, replace paper textbooks.
- Make discovering the universe fun

### Anti-Goals
1. App hinders instead of smooths the flow of work (i.e. data entry getting in the way of providing health care)
2. App furthers the gap between wealthy & poor researchers, instead of reducing it.
3. Become another amoral villanious for-profit publisher. 

### Specs

Built with Flutter framework (plus GetX microframework) for JIT hot reload and AOT compiling to native Android, iOS, Web, Mac, PC, and Linux. Backend currently Firebase.
