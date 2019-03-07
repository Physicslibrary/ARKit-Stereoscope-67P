/*
 
 ARKit-Stereoscope-Comet-67P
 
 https://physicslibrary.github.io/ARKit-Stereoscope-Comet-67P/
 
 MIT License

Copyright (c) 2019 Hartwell Fong

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

 
 Mar 6, 2019.
 
 This playground was inspired by a European Space Agency's webpage explaining the relative sizes of the Rosetta space probe to comet 67P/Churyumov-Gerasimenko.
 
 sci.esa.int/rosetta/54831-how-big-is-rosetta-compared-with-the-comet/
 
 Question: What would it be like if one could see the relative sizes of Rosetta and 67P in virtual reality?
 
 Since ESA and NASA have an educational policy of open sourcing their data such as 3D models and images, one can use tools such Swift Playgrounds and ARKit to visualize the data with a stereoscope.
 
 The Rosetta model is positioned 1 km from the 67P comet using Blender. There are cubes placed at every 1 km from 1 to 10 km from 67P. This helps to give a sense of distance and a kilometer is a familiar thing. Placing Rosetta 1 km above the comet gives it a sense of scale.
 
 Note: Rosetta was 1 km from 67P on its last mission
 
 https://m.esa.int/Our_Activities/Space_Science/Rosetta/Mission_complete_Rosetta_s_journey_ends_in_daring_descent_to_comet
 
 Credits
 
 ESA_Gaia_DR2_AllSky_Brightness_Colour_Cartesian_2000x1000.png
 Date: 25 April 2018
 Satellite: Gaia
 Copyright: ESA/Gaia/DPAC, CC BY-SA 3.0 IGO
 http://sci.esa.int/gaia/60196-gaia-s-sky-in-colour-equirectangular-projection/
 
 67P.obj is scaled, positioned, and exported from Blender using CSHP_DV_257_01_______00343.obj
 Copyright: ESA/Rosetta/NAVCAM  CC BY-SA IGO 3.0
 https://imagearchives.esac.esa.int/index.php?/page/navcam_3d_models
 
 67P.png
 Cycles render baked in Blender 2.79b using 67P.obj
 
 rosetta.obj
 Author/Origin: Eyes on the Solar System. NASA/JPL-Caltech
 https://nasa3d.arc.nasa.gov/detail/eoss-rosetta
 
 Blender is used to scale 67P.obj to 4100m, rosetta.obj to 32m, and positioned 1km apart
 
 https://www.blender.org/
 
 The OWL Stereoscope Viewer from The London Stereoscopic Ltd
 
 https://www.londonstereo.com
 
 Thank to Dr. Brian May for developing an amazingly simple tool that can be used with the 9.7" iPad.
 
 Apple iOS Swift Playgrounds to access ARKit and SceneKit (set up scene, read 3D files, attact a virtual camera for lefteye to ARKit iPad camera righteye to make a stereoscope, 6DOF tracking)
 
 https://www.apple.com/ca/swift/playgrounds/
 
 This playground is hardwired for Apple 2018 9.7" iPad (introduced at Apple Special Event March 27, 2018, Chicago).
 
 cube.obj was created in Blender
 a series of 2mx2mx2m cube placed at every km from 1 to 10km
 to give another sense of scale
 
 Tips:
 
 If frame rate <60Hz, stop playground and run again
 
 If still <60Hz, stop playground and run again
 
 If still <60Hz after several tries, close something
 
 This playground doesn't look for a flat plane to put virtual objects on, instead the initial position of the iPad is the world origin when "Run My Code" is pressed.
 
 All virtual objects are positioned and oriented according to this world origin (with righteye.debugOptions on, the world origin is an XYZ or RGB axis)

*/

import ARKit
import PlaygroundSupport

var righteye = ARSCNView()
var right = SCNScene()
righteye.scene = right
righteye.scene.background.contents = UIImage(named:"ESA_Gaia_DR2_AllSky_Brightness_Colour_Cartesian_2000x1000.png")  // comment out too for camera view
righteye.automaticallyUpdatesLighting = false
righteye.autoenablesDefaultLighting = false
righteye.showsStatistics = true  // comment out to turn off

var lefteye = SCNView()
var left = SCNScene()
lefteye.scene = right
lefteye.showsStatistics = true  // comment out to turn off

let config = ARWorldTrackingConfiguration()
righteye.session.run(config)

righteye.debugOptions = [
    //ARSCNDebugOptions.showFeaturePoints,
    ARSCNDebugOptions.showWorldOrigin  // comment out to turn off
]

var box = SCNScene(named: "rosetta.obj")!
let node = box.rootNode.childNodes[0]
node.position = SCNVector3(x: 0, y: 0, z: 0)
node.eulerAngles = SCNVector3(0, 1.57, 0)
node.scale = SCNVector3(1, 1, 1)
righteye.scene.rootNode.addChildNode(node)

node.geometry?.firstMaterial?.fillMode = .lines
node.geometry?.firstMaterial?.emission.contents = UIColor.white
node.geometry?.firstMaterial?.isDoubleSided = false

var box2 = SCNScene(named: "67P.obj")!
let node2 = box2.rootNode.childNodes[0]
node2.position = SCNVector3(x: 0, y: 0, z: 0)
node2.eulerAngles = SCNVector3(0, 1.57, 0)
node2.scale = SCNVector3(1, 1, 1)
righteye.scene.rootNode.addChildNode(node2)

node2.geometry?.firstMaterial?.emission.contents = UIImage(named: "67P.png")
node2.geometry?.firstMaterial?.isDoubleSided = true
 
// to see wireframe comet, comment out the two lines above and uncomment the three lines below

/*
 node2.geometry?.firstMaterial?.fillMode = .lines
 node2.geometry?.firstMaterial?.emission.contents = UIColor.white
 node2.geometry?.firstMaterial?.isDoubleSided = true
 */
 
var box3 = SCNScene(named: "cube.obj")!
let node3 = box3.rootNode.childNodes[0]
node3.position = SCNVector3(x: 0, y: 0, z: 0)
node3.eulerAngles = SCNVector3(0, 1.57, 0)
node3.scale = SCNVector3(1, 1, 1)
righteye.scene.rootNode.addChildNode(node3)

node3.geometry?.firstMaterial?.fillMode = .lines
node3.geometry?.firstMaterial?.emission.contents = UIColor.white
node3.geometry?.firstMaterial?.isDoubleSided = false

var ipd = -0.064
var cameraNode = SCNNode()
let camera = SCNCamera()
camera.xFov = 39
camera.yFov = 50
camera.zFar = 1000
camera.zNear = 0.1
cameraNode.camera = camera
cameraNode.position = SCNVector3(ipd,0,0)
righteye.pointOfView?.addChildNode(cameraNode)

lefteye.pointOfView = cameraNode

lefteye.isPlaying = true

var imageView = UIImageView()

lefteye.frame = CGRect(x: 0, y: 0, width: 344, height: 380)
imageView.addSubview(lefteye)

righteye.frame = CGRect(x: 344, y: 0, width: 344, height: 380)
imageView.addSubview(righteye)

PlaygroundPage.current.liveView = imageView

// in last line, change imageView to righteye for mono view
// observe differences between stereo and mono views (stereopsis)



