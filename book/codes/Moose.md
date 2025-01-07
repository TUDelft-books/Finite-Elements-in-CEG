# Moose

Moose (Multiphysics Object-Oriented Simulation Environment) is a computational framework designed for solving complex multiphysics problems using the finite element method (FEM). It provides a flexible platform that allows users to create custom simulations by writing input files and extending its capabilities with C++ code. Moose is particularly powerful for simulating multiphysics problems. The core of Moose is written in C++, but it allows users to interact through both input files and Python scripts for automation and post-processing. The framework includes many pre-built modules for common multiphysics problems, but users can also add custom physics models, solvers, and material behaviors. Moose supports parallel computation, making it suitable for large-scale simulations on high-performance computing systems. The platform’s modular design allows for easy integration with other software tools and solvers. For users with minimal programming experience, Moose provides a high-level interface to set up and solve simulations without the need for extensive coding. However, advanced users can extend the framework by writing custom code to implement new solvers or physics models. Moose is widely used in research for solving multiphysics problems that require accurate, efficient, and scalable simulations.

You can install Moose [here](https://mooseframework.inl.gov/getting_started/installation/index.html).

<figure id="fig-indenter-video" style="text-align: center; margin: auto;">
  <!-- This container will hold the dynamic media (image or video) -->
  <div id="dynamic-media-container" style="width: 600px; margin: auto;"></div>
  <figcaption style="margin-top: 8px; font-size: 14px; color: #555; text-align: center;">
    <strong>Figure 1:</strong> Example of scientific visualization from the
    <a href="https://mooseframework.inl.gov/gallery.html" target="_blank" rel="noopener noreferrer">
      MOOSE gallery
    </a>.
  </figcaption>
</figure>

<script>
  // List of media to display
  const media = [
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/weld.mp4",
      alt: "Welding simulation of a pressure vessel"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/3D_SSB.mp4",
      alt: "Charge-discharge cycle of a full solid-state battery"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/streamlines_rock.mp4",
      alt: "Flow Streamlines in Digital Rock"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/twist_gallery.mp4",
      alt: "Wire Twist"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/golem_app_reservoir_analysis.mp4",
      alt: "Faulted Geothermal Reservoirs"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/laser_welding.mp4",
      alt: "Laser Melt Pool"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/corner_flow.mp4",
      alt: "Single-phase Flow in a Packed Bed"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/elder.mp4",
      alt: "Density Driven Porous Flow"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/step10_result.mp4",
      alt: "Multi-scale Simulation"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/densification.mp4",
      alt: "3D Densification of Snow"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/snow.mp4",
      alt: "Dendritic Crystal Growth"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/ch_40.mp4",
      alt: "3D Spinodal Decomposition"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/dipole_antenna.mp4",
      alt: "2D Half-Wave Dipole Antenna"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/grain_tracker.mp4",
      alt: "3D Grain Tracking"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/level_set/vortex_out.mp4",
      alt: "Vortex Benchmark"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/gallery/soil.mp4",
      alt: "Soil Desiccation Simulation"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/contact/2d_indenter.mp4",
      alt: "Axisymmetric Spherical Indenter"
    },
    {
      src: "https://mooseframework.inl.gov/large_media/contact/ironing_gallery.mp4",
      alt: "Frictional Ironing Problem with Mortar Contact"
    }
  ];

  // Select a random image
  const randomMedia = media[Math.floor(Math.random() * media.length)];

  // Set the image source and alt text
  const container = document.getElementById("dynamic-media-container");
  const videoElement = document.createElement("video");
  videoElement.src = randomMedia.src;
  videoElement.alt = randomMedia.alt;
  videoElement.style.width = "100%"; // Adjust width
  videoElement.autoplay = true; // Autoplay the video
  videoElement.loop = true; // Loop the video
  videoElement.muted = true; // Mute the video
  container.appendChild(videoElement);

  // Add a paragraph below the media to display the alt text
  const description = document.createElement("p");
  description.textContent = randomMedia.alt; // Use the alt text as the description
  description.style.marginTop = "8px";
  description.style.fontSize = "14px";
  description.style.color = "#555";
  description.style.textAlign = "center";
  container.appendChild(description);
</script>
