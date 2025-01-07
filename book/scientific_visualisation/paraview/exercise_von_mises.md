# Exercise: Visualisation for mechanics and flow simulation

In this exercise, we are going to make a visualisation that displays both mechanics and flow simulations. On one side, visualisation of a vertical compression of a 2m-long block which is solved with linear elasticity and ideal plasticity. On the other, visualisation of streamlines generated from a 2D simulation of Stokes flow-through on the front face of the block. The [data](https://data.4tu.nl/ndownloader/items/6e22cba3-f963-4424-bfd0-d1c06f1002d6/versions/1) can be downloaded here.

<figure id="fig-indenter-image" style="text-align: center; margin: auto;">
  <img src="https://data.4tu.nl/thumbnails/e4fb265b-f05b-4a8e-b2c0-afde16240d45.png"
       alt="Streamtracer"
       style="width: 300px;">
  <figcaption style="margin-top: 8px; font-size: 14px; color: #555; text-align: center;">
    <strong>Figure 1:</strong> The project from the 4TU-database, exposed at the sixth floor of the CEG building, which we are going to reproduce approximately from the raw simulation data.
  </figcaption>
</figure>

---

### Exercise 1: Visualise the stress distribution

In this first exercise, we want to visualise the deviatoric stress (von Mises stress) distribution on the deformed block. This is the mechanical part of the problem, simulated in the `3MD_visual_3Dmech.e` data file.

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-bottom: 10px;">
  <details>
    <summary style="font-size: 16px;"> <strong>Task 1:</strong> Download the data, open it in Paraview, and click on Apply.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/RIRKX48enO4"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>


---

Note that we can now see the 2m-long block. Let's make the visualisation look better and nicer!

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-bottom: 10px;">
  <details>
    <summary style="font-size: 16px;"> <strong>Task 2:</strong> Show the mesh and the von Mises stress. Make sure the data range is from 0 to 1.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>The mesh can be shown by changing the representation in the Properties Panel to "Surface with Edges". To adjust the data range of the von Mises stress, we can click on "Rescale data to custom range" under Coloring in the Properties Panel and set the values manually.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/l9DTtRvmo3U"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px;"> <strong>Task 3:</strong> Pick a desired color map.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>The color map can be changed by clicking on the "Edit color map" button in the Coloring section in the Properties Panel. In this menu, you can choose different preset color maps. Choose the one you like.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/chdTDbpRh1w"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px;"> <strong>Task 4:</strong> Edit the color legend such that the name of the legend is "von Mises" and the legend is located in the top right corner. Make sure it fits by making the legend smaller, changing the font size, and adjusting the color bar thickness.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>The color legend can be edited by clicking on "Edit color bar legend" under Coloring in the Properties Panel. You can drag the legend to the right corner with your mouse and in the menu, you can change the font size and color bar thickness to make sure that it fits perfectly. You can change the format of the text by clicking on the toggle advanced properties (little options sign on the right). Set the "label format" to a notation you like to make sure the legend looks nice.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/3uUQK9qlulM"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 5:</strong> Use Warp by Vector to visualise the deformations resulting from the applied stress.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Warp by Vector can be found in the list of common filters.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/Cufj4i8NKto"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

Now, we have made a nice visualisation of the mechanical data and the deformation. In the next part of the exercise, we are going to combine the mechanical part with the flow and create an animation.

### Exercise 2: Visualise the streamlines and export the animation

In this part of the exercise, we are going to visualise the flow simulation from the `3MD_2D_flow_front.e` data file.

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 1:</strong> Use the calculator to recreate the vector of fluid velocity.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Using both components vel_X and vel_Y, the formula to input in the calculator is <code>vel_X * iHat + vel_Y * jHat</code>.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/6LarTAMW47g"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 2:</strong> Use the transform filter to translate the dataset along the z-axis by the width of the block (4.17). </summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>In the properties of the transform filter, make sure the translate coordinates are set to: <code>0, 0, 4.17</code></p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/fOC2nJ-BtLw"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 3:</strong> Use the stream tracer filter to generate the streamlines of flow. </summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Create a line seed at the inlet for the stream tracer below "Line Parameters" in the Properties Panel, across the width of the channel from <code>0</code> to <code>1.94</code> in the y-axis . Make sure the streamlines remain individually visible by lowering the Resolution parameter if needed.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/fGnSSGQxt88"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 4:</strong> Use the clip filter to show the streamlines just on one half of the structure. </summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Make sure the clip type = box and the length is equal to <code>11.25</code> and the width is non zero.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/jzEsFlcEk7w"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 5:</strong> Animate the clipping length to let the streamlines appear over the time of the mechanical simulation. </summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Under view, select Time Manager. In this menu we can select Clip1 - ClipType - Length(0) and make sure we add this by clicking on the plus.</p>
      </details>
      <details>
        <summary><strong>Solution</strong></summary>
        <div style="position: relative; width: 100%; height: 0; padding-bottom: 56.25%; margin-top: 10px;">
          <iframe
              src="https://www.youtube.com/embed/dBqqv9SIVYE"
              style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
          ></iframe>
        </div>
      </details>
    </div>
  </details>
</div>

---

In this exercise, we created a nice looking visualisation for a mechanics and flow problem. Try downloading other examples from the [4TU website](https://data.4tu.nl/search?search=scientific_visualisation) to gain more inspiration!
