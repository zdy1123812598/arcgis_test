<template>
  <div id='viewDiv'></div>
</template>
<script url="https://js.arcgis.com/4.15/"></script>
<script>
import { loadModules } from 'esri-loader'

export default {
  name: 'SceneView',
  data () {
    return {}
  },
  mounted () {
    const options = {
      url: 'https://js.arcgis.com/4.15/'
    }

    loadModules([
      'esri/Map',
      'esri/views/SceneView',
      'esri/layers/SceneLayer',
      'esri/layers/TileLayer',
      'esri/layers/VectorTileLayer',
      'esri/layers/IntegratedMeshLayer'
    ], options)
      .then(([Map, SceneView, SceneLayer, TileLayer, VectorTileLayer, IntegratedMeshLayer]) => {

        const webscene = new WebScene({
          portalItem: {
            id: "d708e9d63336499587b35b3b70339bad"
          }
        })
        const layer = new IntegratedMeshLayer({
          url:
            "https://tiles.arcgis.com/tiles/FQD0rKU8X5sAQfh8/arcgis/rest/services/VRICON_Yosemite_Sample_Integrated_Mesh_scene_layer/SceneServer",
          // Yosemite Valley Integrated Mesh data provided by VRICON (www.vricon.com)
          copyright: "VRICON"
        });

        webscene.add(layer);

        const view = new SceneView({
          container: "viewDiv",
          map: webscene,
          qualityProfile: "high"
        });
        let roadsLayer = null;
        webscene.when(function() {
          roadsLayer = webscene.allLayers.getItemAt(3);
        });
      })
      .catch(err => {
        console.error(err)
      })
  }
}
</script>

<style scoped>
  @import url('https://js.arcgis.com/4.15/esri/css/themes/light/main.css');
  html,
  body,
  #viewDiv {
    padding: 0;
    margin: 0;
    height: 800px;
    width: 800px;
  }
</style>
