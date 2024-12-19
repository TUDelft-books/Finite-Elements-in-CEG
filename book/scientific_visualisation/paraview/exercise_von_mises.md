# Exercise: Von Mises stress visualisation

In this exercise, we are going to make a visualisation that takes both mechanics and flow into consideration. On one side, visualisation of a vertical compression of a 2m-long block is solved with linear elasticity and ideal plasticity. On the other, visualisation of streamlines is generated from a 2D simulation of Stokes flow-through on the top and front face. The [data](https://data.4tu.nl/ndownloader/items/6e22cba3-f963-4424-bfd0-d1c06f1002d6/versions/1) can be downloaded here. 

```{figure} https://data.4tu.nl/thumbnails/e4fb265b-f05b-4a8e-b2c0-afde16240d45.png
---
width: 300px
name: fig-4tu-project
---
The project from the 4TU-database, which we are going to imitate from the raw data.
````

---

### Exercise 1: Visualise the von Mises stress

In this first exercise, we are going to focus on the von Mises stress only. This the the mechanical part of the problem. Therefore, we will focus on the `3MD_visual_3Dmech.e` data.

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-bottom: 10px;">
  <details>
    <summary style="font-size: 16px;"> <strong>Task 1:</strong> Download the data, open it in Paraview, and click on Apply.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>No hints available for this task.</p>
      </details>
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
        <p>The mesh can be shown by changing the representation in the Properties Panel to "Surface with Edges". To rescale the von Mises stress, we can click on "Rescale data to custom range" under Coloring in the Properties Panel and set the values manually.</p>
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
    <summary style="font-size: 16px;"> <strong>Task 3:</strong> Change the color map to a color map you like.</summary>
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
        <p>The color legend can be edited by clicking on "Edit color bar legend" under Coloring in the Properties Panel. You can drag the legend to the right corner with your mouse and in the menu, we can change the font size and color bar thickness to make sure that it fits perfectly. We can change the format of the text by clicking on the toggle advanced properties (little options sign on the right). Set the "label format" to a notation you like to make sure the legend looks nice.</p>
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
    <summary style="font-size: 16px" ><strong>Task 5:</strong> Use Warp by Vector to visualise the deformation due to the stress.</summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>No hints available for this task.</p>
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

In this part of the exercise, we are going to combine the mechanical and flow part. Therefore we are going to work with the `3MD_2D_flow_front.e` data.

---

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px; margin-top: 10px;">
  <details>
    <summary style="font-size: 16px" ><strong>Task 1:</strong> Use the calculator to recreate the velocity vector, using the formula: <code>vel_X * iHat + vel_Y *jHat</code></summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>No hints available for this task.</p>
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
    <summary style="font-size: 16px" ><strong>Task 2:</strong> Use the transform filter to translate the velocity vector along the z-axis by 4.17. </summary>
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
    <summary style="font-size: 16px" ><strong>Task 3:</strong> Use the stream tracer filter to show the streamlines. </summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Create an upward vector only in the y-direction from <code>0</code> to <code>1.94</code> for the streamtracer below "line parameters" in the Properties Panel. Make sure the streamlines are visible by adjusting the resolution.</p>
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
        <p>Make sure the clip type = box and the length is equal to <code>11.25</code>.</p>
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
    <summary style="font-size: 16px" ><strong>Task 5:</strong> Make an animation of the visualisation. </summary>
    <div style="margin-left: 20px; margin-top: 10px;">
      <details>
        <summary><strong>Hint</strong></summary>
        <p>Under view, select Time Manager. In this menu we can select Clip1 - ClipType - Length(0) (make sure show box in clip is disabled) and making sure we add this by clicking on the plus.</p>
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

In this exercise, we created a nice looking visualisation for a multiphysics problem. Try downloading other examples from the [4TU website](https://data.4tu.nl/search?search=scientific_visualisation) to gain more knowledge!

