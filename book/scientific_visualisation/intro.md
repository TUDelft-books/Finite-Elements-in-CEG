# Scientific visualisation

Scientific visualisation is the graphical representation of data, phenomena, or models to enhance understanding and gain insights into complex scientific concepts. It is the bridge from our abstract virtual world to something more real and tangible. By converting abstract or numerical data into a visual format, scientists, engineers, and researchers can perceive patterns, relationships, and deviations that might be difficult to perceive from raw data alone. The visualisation of data provides several benefits:

<figure id="fig-indenter-video" style="text-align: center; margin: auto;">
  <img id="dynamic-image" alt="Dynamic scientific visualization" style="width: 300px;">
  <figcaption style="margin-top: 8px; font-size: 14px; color: #555; text-align: center;">
    Example of scientific visualization from the 
    <a href="https://data.4tu.nl/search?search=scientific_visualisation" target="_blank" rel="noopener noreferrer">
      4TU scientific visualization database.
    </a>.
  </figcaption>
</figure>

<script>
  // List of images to display
  const images = [
    {
      src: "https://data.4tu.nl/thumbnails/5519319c-87e8-4329-8ab7-7a3863c2451f.gif",
      alt: "Fluid microstructure interaction"
    },
    {
      src: "https://data.4tu.nl/thumbnails/228662c1-a6d8-4736-9eb2-aa6d0289775a.gif",
      alt: "Hydroelastic response of floating solar farm"
    },
    {
      src: "https://data.4tu.nl/thumbnails/621dd1d1-6afa-452e-8f1a-58ea2b617164.gif",
      alt: "Streamlines of flow through a rock microstructure"
    },
        {
      src: "https://data.4tu.nl/thumbnails/e4fb265b-f05b-4a8e-b2c0-afde16240d45.png",
      alt: "Elastoplastic compression and flow through"
    },
        {
      src: "https://data.4tu.nl/thumbnails/5af44748-8c5a-43b8-b16c-36e109de1a6b.gif",
      alt: "Flow trough dissolving rock microstructure"
    },
        {
      src: "https://data.4tu.nl/thumbnails/1fa79b0b-3e6e-474c-a602-6bd74f76b1f9.gif",
      alt: "Faulted reservoir reactivation due to trap charging"
    }
  ];

  // Select a random image
  const randomImage = images[Math.floor(Math.random() * images.length)];

  // Set the image source and alt text
  const imageElement = document.getElementById("dynamic-image");
  imageElement.src = randomImage.src;
  imageElement.alt = randomImage.alt;
</script>


<u>1. Visual feedback</u>:
Visualisation offers immediate, intuitive feedback during the data exploration and model-building processes. Instead of relying solely on numerical summaries, we can interact with data in a visually, making it easier to recognize trends, test hypotheses, or identify errors. For example, in fluid dynamics, visualising flow patterns can reveal turbulence or laminar regions.

<u>2. Relatedness to topic</u>:
When presenting findings or exploring phenomena, the visualisation must be closely related to the scientific context. Relating the visualisation directly to the topic ensures that insights are grounded in the problem's real-world context, promoting clarity and relevance.

<u>3. Model inspection for debugging</u>:
Visualisation can serve as a tool to evaluate and debug computational models. We can identify errors, inconsistencies, or unexpected behavior within a simulation by observing how the model behaves visually.

<u>4. Presentation of results</u>:
An effective visualisation communicates results in an accessible, compelling way, making complex findings understandable to both experts and non-experts. 

To create some visualisations, Paraview is commonly used. Paraview is the most popular open source software for scientific visualisation. 

This chapter contains the following sections:

```{tableofcontents}
```