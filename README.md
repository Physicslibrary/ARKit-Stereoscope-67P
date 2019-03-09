# ARKit-Stereoscope-67P

ARKit stereoscope visualizes the relative sizes of ESA Rosetta space probe to 67P/Churyumov-Gerasimenko comet.

<img src="67P-1.jpg" width="640">
<img src="67P-2.jpg" width="640">
<img src="67P-3.jpg" width="640">

This project was inspired by a European Space Agency's webpage explaining the relative sizes of the Rosetta space probe to comet 67P/Churyumov-Gerasimenko:
 
[ESA: How big is Rosetta compared with the comet?](http://sci.esa.int/rosetta/54831-how-big-is-rosetta-compared-with-the-comet/)

Question: What would it be like to see the relative sizes of Rosetta and 67P in virtual reality?
 
With ESA and NASA open sourcing their data such as 3D models and images, anyone can use tools such as iPad Swift Playgrounds and ARKit to visualize the data with a stereoscope.

# Hardware

1. Apple 9.7" iPad (tested on 2018 model, A9 CPU or higher for ARKit, should work on 2017 9.7" iPad).

2. The OWL Stereoscopic Viewer(£15.00) from [The London Stereoscopic Company Ltd](https://www.londonstereo.com/)

   Beside using it to view 3D models with tracking, it can also be used in a browser to view stereoscopic images from [Library of Congress](http://www.loc.gov/pictures/collection/stereo/) or [New York Public Library](https://stereo.nypl.org/).

   For more current images, try [London Stereoscopic Company Ltd](https://www.londonstereo.com/3-D-gallery1.html).
   
   <img src="owl-viewer.jpg" width="640">

It is advisable to get a protective silicon case for the iPad to minimize the stereoscope sliding on the screen. The stereoscopic viewer is held in place by the user to allow switching between viewing and programming Swift. "Portrait Orientation Lock" is on as this should be the most comfortable position to hold the iPad with the viewer and moving around virtual objects.

# Software

Apple Swift Playgrounds (2.2) from iOS App Store. Swift Playgrounds lets kids program their iPad directly to experiment with ARKit and Scenekit.

[Swift Playgrounds](https://www.apple.com/ca/swift/playgrounds/)

# Installation

In iOS Safari, [download ARKit-Stereoscope-67P.playground.zip](https://github.com/Physicslibrary/ARKit-Stereoscope-67P/blob/master/ARKit-Stereoscope-67P.playground.zip), and "Open in Playgrounds".

ARKit-Stereoscope-67P playground was created from the Blank template in Swift Playgrounds.

# Credits
 
ESA_Gaia_DR2_AllSky_Brightness_Colour_Cartesian_2000x1000.png<br>
Date: 25 April 2018<br>
Satellite: Gaia<br>
Copyright: ESA/Gaia/DPAC, CC BY-SA 3.0 IGO<br>
http://sci.esa.int/gaia/60196-gaia-s-sky-in-colour-equirectangular-projection/<br>
 
67P.obj is scaled, positioned, and exported from Blender using CSHP_DV_257_01_______00343.obj<br>
Copyright: ESA/Rosetta/NAVCAM – CC BY-SA IGO 3.0<br>
https://imagearchives.esac.esa.int/index.php?/page/navcam_3d_models<br>
 
67P.png<br>
Cycles render baked in Blender 2.79b using 67P.obj<br>
 
rosetta.obj<br>
Author/Origin: Eyes on the Solar System. NASA/JPL-Caltech<br>
https://nasa3d.arc.nasa.gov/detail/eoss-rosetta<br>
 
Blender scaled 67P.obj to 4100m, rosetta.obj to 32m, and positioned 1km apart<br>
 
https://www.blender.org/<br>
 
# How to use Blender to scale Rosetta and 67P comet


